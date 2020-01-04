//
//  AQChatImageMessageCell.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 29/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class AQChatImageMessageCell: UITableViewCell {
    
    let chatImage = AQImageLoader()
    let bubbleBackgroundView = UIView()
    let messageTimeLabel = UILabel()
    let readRecipts = UIImageView()
    private var aleadingConstraint: NSLayoutConstraint!
    private var atrailingConstraint: NSLayoutConstraint!
    var timeLabelLeadingConstraint : NSLayoutConstraint!
    var timeLabelTrailingConstraint : NSLayoutConstraint!
    
    var chatMessage: AQMessage? {
        didSet {
            
            messageTimeLabel.font = messageTimeLabel.font.withSize(12)
            messageTimeLabel.textColor = UIColor.darkGray
            messageTimeLabel.isHidden = true
            let date = Date(timeIntervalSince1970: TimeInterval(chatMessage?.sentAt ?? 0))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            dateFormatter.timeZone = NSTimeZone.local
            let dateString : String = dateFormatter.string(from: date)
            
            if chatMessage?.status.isSend == false {
                           messageTimeLabel.text =  "Sending..."
                           chatImage.image = #imageLiteral(resourceName: "default_Pending")
            }else{
                messageTimeLabel.text =  dateString
                if let url = URL(string: chatMessage?.imageUrl ?? ""){
                    chatImage.loadImageWithUrl(url)
                }
            }
            messageTimeLabel.text =  dateString
            chatImage.contentMode = .scaleAspectFill
            //let myUID = UserDefaults.standard.string(forKey: "LoggedInUserUID")
            bubbleBackgroundView.backgroundColor = chatMessage?.user.userId == "13aff" ? .white : UIColor(white: 0.80, alpha: 1)
            readRecipts.image = UIImage(named: "seen")
                   
                   DispatchQueue.main.async {  [weak self] in
                       guard let strongSelf = self
                           else
                       {
                           return
                       }

                    if strongSelf.chatMessage?.status.isSend == true{
                        strongSelf.readRecipts.image = UIImage(named: "seen")
                    }else if strongSelf.chatMessage?.status.isRead == true {
                           strongSelf.readRecipts.image = UIImage(named: "seen")
                       }
                    else if strongSelf.chatMessage?.status.isDelivered == true {
                           strongSelf.readRecipts.image = UIImage(named: "seen")
                       }else{
                           strongSelf.readRecipts.image = UIImage(named: "seen")
                       }
                   }
            
            if chatMessage?.user.userId == "13aff" {
                aleadingConstraint.isActive = false
                atrailingConstraint.isActive = true
                timeLabelLeadingConstraint.isActive = false
                timeLabelTrailingConstraint.isActive = true
                messageTimeLabel.isHidden = false
                //if chatMessage.receiverType == .user{
                    readRecipts.isHidden = false
//                }else{
//                    readRecipts.isHidden = true
//                }
            } else {
                aleadingConstraint.isActive = true
                atrailingConstraint.isActive = false
                timeLabelLeadingConstraint.isActive = true
                timeLabelTrailingConstraint.isActive = false
                messageTimeLabel.isHidden = false
                readRecipts.isHidden = true
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        chatImage.layer.cornerRadius = 20
        chatImage.clipsToBounds = true
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 20
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.clipsToBounds=true
        addSubview(messageTimeLabel)
        addSubview(bubbleBackgroundView)
        addSubview(chatImage)
        addSubview(readRecipts)
        
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        messageTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        // lets set up some constraints for our label
        
        
        let constraints = [
            
            messageTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: -250),
            messageTimeLabel.bottomAnchor.constraint(equalTo: chatImage.bottomAnchor, constant: 10),
            messageTimeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            chatImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            chatImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            chatImage.widthAnchor.constraint(equalToConstant: 250),
            chatImage.heightAnchor.constraint(equalToConstant: 250),
            
            bubbleBackgroundView.topAnchor.constraint(equalTo: chatImage.topAnchor, constant: 0),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: chatImage.leadingAnchor, constant: 0),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: chatImage.bottomAnchor, constant: 0),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: chatImage.trailingAnchor, constant: 0),
        ]
        NSLayoutConstraint.activate(constraints)
        
        
        timeLabelLeadingConstraint = messageTimeLabel.leadingAnchor.constraint(equalTo: chatImage.leadingAnchor, constant: 0)
        timeLabelLeadingConstraint.isActive = false
        timeLabelTrailingConstraint = messageTimeLabel.trailingAnchor.constraint(equalTo: chatImage.trailingAnchor, constant: 0)
        timeLabelTrailingConstraint.isActive = false
        
        aleadingConstraint = chatImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        aleadingConstraint.isActive = false
        
        atrailingConstraint = chatImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        atrailingConstraint.isActive = false
        
        
        readRecipts.translatesAutoresizingMaskIntoConstraints = false
        readRecipts.widthAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        readRecipts.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        readRecipts.trailingAnchor.constraint(equalTo: messageTimeLabel.leadingAnchor, constant: -10).isActive = true
        readRecipts.bottomAnchor.constraint(equalTo: chatImage.topAnchor, constant: -3).isActive = true
        readRecipts.clipsToBounds = true
       
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
