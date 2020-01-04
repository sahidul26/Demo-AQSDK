//
//  AQChatTextMessageCell.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 29/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class AQChatTextMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let messageBackgroundView = UIView()
    let messageTimeLabel = UILabel()
    let readRecipts = UIImageView()
    var messageLabelLeadingConstraint : NSLayoutConstraint!
    var messageLabelTrailingConstraint : NSLayoutConstraint!
    var timeLabelLeadingConstraint : NSLayoutConstraint!
    var timeLabelTrailingConstraint : NSLayoutConstraint!

    
    var chatMessage: AQMessage? {
        didSet {
            
            messageLabel.text = chatMessage?.content
            let date = Date(timeIntervalSince1970: TimeInterval(chatMessage?.sentAt ?? 0))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            dateFormatter.timeZone = NSTimeZone.local
            let dateString : String = dateFormatter.string(from: date)
            
            if chatMessage?.status.isSend == false {
                messageTimeLabel.text =  "Sending..."
            }else{
                messageTimeLabel.text =  dateString
            }
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
                
                messageLabelLeadingConstraint.isActive = false
                messageLabelTrailingConstraint.isActive = true
                timeLabelTrailingConstraint.isActive = true
                timeLabelLeadingConstraint.isActive = false
                messageTimeLabel.textColor = AQConstants.COLOR.separator
                readRecipts.isHidden = false
                
                messageBackgroundView.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner ], radius: 15, borderColor: .clear, borderWidth: 0, withBackgroundColor: "959dea")
                messageLabel.textColor = UIColor.white
                
            } else {
                
                messageLabelLeadingConstraint.isActive = true
                messageLabelTrailingConstraint.isActive = false
                timeLabelTrailingConstraint.isActive = false
                timeLabelLeadingConstraint.isActive = true
                messageTimeLabel.textColor = AQConstants.COLOR.separator
                readRecipts.isHidden = true
                self.messageBackgroundView.roundCorners([.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner ], radius: 15, borderColor: .clear, borderWidth: 0, withBackgroundColor: "E6E9ED")
                messageLabel.textColor = UIColor.white
                
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        messageBackgroundView.clipsToBounds = true
        messageBackgroundView.layer.cornerRadius = 15
        messageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.backgroundColor = .clear
        
        addSubview(messageBackgroundView)
        addSubview(messageLabel)
        addSubview(messageTimeLabel)
        addSubview(readRecipts)
        
        
        messageLabel.backgroundColor = UIColor.clear
        messageLabel.numberOfLines = 0
        
        //Setting Constraints for MessageLabel
        messageTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        messageTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        timeLabelLeadingConstraint = messageTimeLabel.leadingAnchor.constraint(equalTo: messageBackgroundView.leadingAnchor, constant: 0)
        timeLabelTrailingConstraint = messageTimeLabel.trailingAnchor.constraint(equalTo: messageBackgroundView.trailingAnchor, constant: 0)
        messageTimeLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 15).isActive = true
        messageTimeLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -15).isActive = true
        messageTimeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        messageTimeLabel.font = messageTimeLabel.font.withSize(10)
        
        readRecipts.translatesAutoresizingMaskIntoConstraints = false
        readRecipts.widthAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        readRecipts.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        readRecipts.trailingAnchor.constraint(equalTo: messageTimeLabel.leadingAnchor, constant: -10).isActive = true
        readRecipts.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -15).isActive = true
        readRecipts.clipsToBounds = true
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: messageTimeLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        messageLabelLeadingConstraint =  messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        messageLabelTrailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        
        messageBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -12).isActive = true
        messageBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -12).isActive = true
        messageBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant:12).isActive = true
        messageBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 12).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
