//
//  AQSessionList.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 25/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class sessionModel: NSObject {
    let session: String?
    let message: String?
    let date: String?
    
    init(session:String?,message:String?,date:String?) {
        self.session = session
        self.message = message
        self.date = date
    }
}

class AQThreadList: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var sessionDB: [sessionModel] = []
    private var indexPathDic: [IndexPath:CGFloat]?
    lazy private var tableView : UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.clipsToBounds = true
        table.tableFooterView = UIView()
        return table
    }()
    lazy private var topView : UIView = {
        var topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = AQConstants.COLOR.primary
        topView.clipsToBounds = true
        return topView
    }()
    lazy private var btnDismiss : UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage.init(named: "back"), for: .normal)
        btn.addTarget(self, action: #selector(self.dismissClick), for: .touchUpInside)
        return btn
    }()
    lazy private var btnConversation : UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage.init(named: "edit"), for: .normal)
        btn.addTarget(self, action: #selector(self.startConversation), for: .touchUpInside)
        return btn
    }()
    @objc private func dismissClick(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func startConversation(){
        print("clicked")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sessionDB.append(sessionModel(session: "Support team", message: "Hi", date: "Dec 18 at 9:10 PM"))
        sessionDB.append(sessionModel(session: "Support team", message: "Hi", date: "Dec 16 at 10:18 PM"))
        
        self.view.backgroundColor = .white
        let width = UIScreen.main.bounds.size.width
        
        self.view.addSubview(self.topView)
        self.topView.anchor(topAnchor: self.view.topAnchor, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, bottomAnchor: nil, width: width, height: 80, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0)
        
        self.topView.addSubview(btnDismiss)
        btnDismiss.anchor(topAnchor: nil, leftAnchor: self.view.leftAnchor, rightAnchor: nil, bottomAnchor: self.topView.bottomAnchor, width: 30, height: 30, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 20, rightPadding: 0, bottomPadding: 5)
        
        self.topView.addSubview(btnConversation)
        btnConversation.anchor(topAnchor: nil, leftAnchor: nil, rightAnchor: self.view.rightAnchor, bottomAnchor: self.topView.bottomAnchor, width: 30, height: 30, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 0, rightPadding: 20, bottomPadding: 10)
        
        let txtSupportLB = UILabel()
        txtSupportLB.translatesAutoresizingMaskIntoConstraints = false
        txtSupportLB.font = txtSupportLB.font.withSize(14)
        txtSupportLB.numberOfLines = 0
        txtSupportLB.textColor = .white
        txtSupportLB.textAlignment = .center
        txtSupportLB.text = "Support team"
        self.topView.addSubview(txtSupportLB)
        txtSupportLB.anchor(topAnchor: self.view.safeTopAnchor, leftAnchor: btnDismiss.leftAnchor, rightAnchor: btnConversation.rightAnchor, bottomAnchor: nil, width: nil, height: nil, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
        
        
        self.view.addSubview(self.tableView)
        self.tableView.anchor(topAnchor: self.topView.bottomAnchor, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, bottomAnchor: self.view.safeBottomAnchor, width: width, height: nil, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0)
        
        self.tableView.register(AQTableViewCell.self, forCellReuseIdentifier: "AQCell")         // register cell name
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionDB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AQCell", for: indexPath) as! AQTableViewCell
        
        let DATA = self.sessionDB[indexPath.row]
        cell.lblSessionName.text = DATA.session
        cell.lblMessage.text = DATA.message
        cell.lblDate.text = DATA.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let AQChat = AQChatViewController.init(nibName: "AQChatViewController", bundle: nil)
        if #available(iOS 13.0, *) {
            AQChat.modalPresentationStyle = .fullScreen
        }
        self.present(AQChat, animated: true, completion: nil)
    }
    
}

class AQTableViewCell: UITableViewCell {
    
    let imgProfile = UIImageView()
    let lblSessionName = UILabel()
    let lblMessage = UILabel()
    let lblDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgProfile.backgroundColor = .blue
        imgProfile.translatesAutoresizingMaskIntoConstraints = false
        lblSessionName.translatesAutoresizingMaskIntoConstraints = false
        lblMessage.translatesAutoresizingMaskIntoConstraints = false
        lblDate.translatesAutoresizingMaskIntoConstraints = false
        lblDate.font = lblDate.font.withSize(10)
        lblDate.textColor = .gray
        
        contentView.addSubview(imgProfile)
        contentView.addSubview(lblSessionName)
        contentView.addSubview(lblMessage)
        contentView.addSubview(lblDate)
        
        imgProfile.anchor(topAnchor: nil, leftAnchor: self.contentView.leftAnchor, rightAnchor: nil, bottomAnchor: nil, width: 50, height: 50, centerX: nil, centerY: self.contentView.centerYAnchor, topPadding: 25, leftPadding: 20, rightPadding: 0, bottomPadding: 25)
        
        imgProfile.layoutIfNeeded()
        imgProfile.layer.cornerRadius = 25
        
        lblSessionName.anchor(topAnchor: imgProfile.topAnchor, leftAnchor: imgProfile.rightAnchor, rightAnchor: nil, bottomAnchor: nil, width: nil, height: nil, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 10, rightPadding: 0, bottomPadding: 0)
        
        lblMessage.anchor(topAnchor: nil, leftAnchor: imgProfile.rightAnchor, rightAnchor: nil, bottomAnchor: imgProfile.bottomAnchor, width: nil, height: nil, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 10, rightPadding: 0, bottomPadding: 0)
        
        lblDate.anchor(topAnchor: imgProfile.topAnchor, leftAnchor: nil, rightAnchor: self.contentView.rightAnchor, bottomAnchor: nil, width: nil, height: nil, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 0, rightPadding: 20, bottomPadding: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
