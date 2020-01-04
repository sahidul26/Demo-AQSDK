//
//  AQChatViewController.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 28/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

final class AQChatViewController: UIViewController,UINavigationControllerDelegate {
    
    private enum Constants {
        static let incomingTextMessageCell = "incomingTextMessageCell"
        static let outgoingTextMessageCell = "outgoingTextMessageCell"
        static let incomingImageMessageCell = "incomingImageMessageCell"
        static let outgoingImageMessageCell = "outgoingImageMessageCell"
        static let contentInset: CGFloat = 5
        static let placeholderMessage = "Type something"
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textAreaBackground: UIView!
    @IBOutlet weak var textAreaBottom: NSLayoutConstraint!
    @IBOutlet weak var emptyChatView: UIView!
    
    // MARK: - Property
    
    var imagePicker = UIImagePickerController()
    
    // MARK: - Actions
    
    @IBAction func onSendButtonTapped(_ sender: Any) {
        sendMessage()
    }
    
    
    // MARK: - Interaction
    
    private func sendMessage() {
        let message: String = textView.text
        guard !message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        textView.endEditing(true)
        addTextViewPlaceholer()
        scrollToLastCell()
        
        messages.append(AQMessage(user: AQUser(name: isEven() ? "Safi" : "Akash", userId: isEven() ? "13aff" : ""), status: AQMessageStatus(isSend: true, isDelivered: false, isRead: false), content: message, sentAt: Date().timeIntervalSince1970, messageType: .text, imageUrl: "", isIncoming: isEven()))
    }
    
    var messages: [AQMessage] = [] {
        didSet {
            emptyChatView.isHidden = !messages.isEmpty
            tableView.reloadData()
        }
    }
    func isEven()->Bool{
        return messages.count % 2 == 0 ? true : false
    }
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(AQChatTextMessageCell.self, forCellReuseIdentifier: Constants.incomingTextMessageCell)
        self.tableView.register(AQChatTextMessageCell.self, forCellReuseIdentifier: Constants.outgoingTextMessageCell)
        
        self.tableView.register(AQChatImageMessageCell.self, forCellReuseIdentifier: Constants.incomingImageMessageCell)
        self.tableView.register(AQChatImageMessageCell.self, forCellReuseIdentifier: Constants.outgoingImageMessageCell)
        
        emptyChatView.isHidden = false
        
        setUpTableView()
        setUpTextView()
        startObservingKeyboard()
        
        tableView.dataSource = self
        
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addTextViewPlaceholer()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Add default shadow to navigation bar
        let navigationBar = navigationController?.navigationBar
        navigationBar?.shadowImage = nil
    }
    @IBAction func dismissClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Keyboard
    
    private func startObservingKeyboard() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil,
            using: keyboardWillAppear)
        notificationCenter.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil,
            using: keyboardWillDisappear)
    }
    
    deinit {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        notificationCenter.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    private func keyboardWillAppear(_ notification: Notification) {
        let key = UIResponder.keyboardFrameEndUserInfoKey
        guard let keyboardFrame = notification.userInfo?[key] as? CGRect else {
            return
        }
        
        let safeAreaBottom = view.safeAreaBottom
        let viewHeight = view.bounds.height
        let safeAreaOffset = viewHeight - safeAreaBottom
        
        let lastVisibleCell = tableView.indexPathsForVisibleRows?.last
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.textAreaBottom.constant = -keyboardFrame.height + safeAreaOffset
                self.view.layoutIfNeeded()
                if let lastVisibleCell = lastVisibleCell {
                    self.tableView.scrollToRow(
                        at: lastVisibleCell, at: .bottom, animated: false)
                }
        })
    }
    
    private func keyboardWillDisappear(_ notification: Notification) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.textAreaBottom.constant = 0
                self.view.layoutIfNeeded()
        })
    }
    
    
    // MARK: - Set up
    
    private func setUpTextView() {
        textView.isScrollEnabled = false
        textView.textContainer.heightTracksTextView = true
        textView.delegate = self
        
        if #available(iOS 11.0, *) {
            textAreaBackground.layer.addShadow(
                color: UIColor(red: 189 / 255, green: 204 / 255, blue: 215 / 255, alpha: 54 / 100),
                offset: CGSize(width: 2, height: -2),
                radius: 4)
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func setUpTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: Constants.contentInset, left: 0, bottom: 0, right: 0)
        tableView.allowsSelection = false
    }
}

// MARK: - UITableViewDataSource
extension AQChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell()
        let messageData = messages[indexPath.row]
        
        switch messageData.messageType{
            
        case .text:
            
            let cellIdentifier = messageData.isIncoming ? Constants.incomingTextMessageCell : Constants.outgoingTextMessageCell
            // Forms Cell for message type of TextMessage
            var textMessageCell = AQChatTextMessageCell()
            textMessageCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AQChatTextMessageCell
            textMessageCell.chatMessage = messageData
            textMessageCell.selectionStyle = .none
            textMessageCell.isUserInteractionEnabled = true
            return textMessageCell
            
        case .image:
            
            let cellIdentifier = messageData.isIncoming ? Constants.incomingImageMessageCell : Constants.outgoingImageMessageCell
            // Forms Cell for message type of image Message
            var imageMessageCell = AQChatImageMessageCell()
            imageMessageCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath) as! AQChatImageMessageCell
            imageMessageCell.chatMessage = messageData
            imageMessageCell.selectionStyle = .none
            return imageMessageCell
            
        case .unknown:break
        @unknown default:
            break
            
        }
        
//        let cellIdentifier = messageData.isIncoming ? Constants.incomingTextMessageCell : Constants.outgoingTextMessageCell
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AQChatTextMessageCell
        
        //        guard let cell = tableView.dequeueReusableCell( withIdentifier: cellIdentifier, for: indexPath) as? AQMessageCell & UITableViewCell else {
        //            return UITableViewCell()
        //        }
        //
        
        //
        //        if indexPath.row < messages.count - 1 {
        //            let nextMessage = messages[indexPath.row + 1]
        //            cell.showsAvatar = message.isIncoming != nextMessage.isIncoming
        //        } else {
        //            cell.showsAvatar = true
        //        }
        
        return cell
    }
    
    private func scrollToLastCell() {
        let lastRow = tableView.numberOfRows(inSection: 0) - 1
        guard lastRow > 0 else {
            return
        }
        
        let lastIndexPath = IndexPath(row: lastRow, section: 0)
        tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
    }
    
    @IBAction func attachementButtonPressed(_ sender: Any) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // -----------  Present the PhotoLibrary --------------//
        let photoLibraryAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("Photo Library", comment: ""), style: .default) { action -> Void in
            
            AQSocketManager.shared.presentPhotoLibrary(for: self)
            AQSocketManager.shared.imagePickedBlock = { [weak self] (photoURL) in
                DispatchQueue.main.async {
                    guard let strongSelf = self
                        else
                    {
                        return
                    }
                    
                    print("photoURL",photoURL)
                    strongSelf.textView.endEditing(true)
                    strongSelf.addTextViewPlaceholer()
                    strongSelf.scrollToLastCell()
                    strongSelf.messages.append(AQMessage(user: AQUser(name: strongSelf.isEven() ? "Safi" : "Akash", userId: strongSelf.isEven() ? "13aff" : ""), status: AQMessageStatus(isSend: true, isDelivered: false, isRead: false), content: "", sentAt: Date().timeIntervalSince1970, messageType: .image, imageUrl: photoURL, isIncoming: strongSelf.isEven()))
                }
            }
            
        }
        
        // -----------  Present the camera --------------//
        let cameraAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default) { action -> Void in
            
            AQSocketManager.shared.presentCamera(for: self)
            AQSocketManager.shared.imagePickedBlock = { [weak self] (photoURL) in
                DispatchQueue.main.async {
                    guard let strongSelf = self
                        else
                    {
                        return
                    }
                    
                    print("photoURL",photoURL)
                    strongSelf.textView.endEditing(true)
                    strongSelf.addTextViewPlaceholer()
                    strongSelf.scrollToLastCell()
                    strongSelf.messages.append(AQMessage(user: AQUser(name: strongSelf.isEven() ? "Safi" : "Akash", userId: strongSelf.isEven() ? "13aff" : ""), status: AQMessageStatus(isSend: true, isDelivered: false, isRead: false), content: "", sentAt: Date().timeIntervalSince1970, messageType: .image, imageUrl: photoURL, isIncoming: strongSelf.isEven()))
                }
            }
            
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { action -> Void in
        }
        
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        actionSheetController.addAction(photoLibraryAction)
        actionSheetController.addAction(cameraAction)
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
        
    }
}

// MARK: - UITextViewDelegate
extension AQChatViewController: UITextViewDelegate {
    private func addTextViewPlaceholer() {
        textView.text = Constants.placeholderMessage
        textView.textColor = AQConstants.COLOR.placeholderBody
    }
    
    private func removeTextViewPlaceholder() {
        textView.text = ""
        textView.textColor = AQConstants.COLOR.darkBody
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        removeTextViewPlaceholder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            addTextViewPlaceholer()
        }
    }
}
