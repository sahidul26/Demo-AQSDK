//
//  ViewController.swift
//  ChatSdk
//
//  Created by Akash Soni on 20/11/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class AQDynamicForm: UIViewController {
    
    let myPickerData = [String](arrayLiteral: "iOS", "Android")
    //static UI
    
    lazy var parentView : UIScrollView = {
        var scrol = UIScrollView()
        scrol.translatesAutoresizingMaskIntoConstraints = false
        scrol.clipsToBounds = true
        return scrol
    }()
    lazy var bgView : UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.clipsToBounds = true
        return bgView
    }()
    lazy var topView : UIView = {
        var topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = AQConstants.COLOR.primary
        topView.clipsToBounds = true
        return topView
    }()
    lazy var txtDepartmentTF : AQTextField = {
        var tf = AQTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = tf.font?.withSize(15)
        tf.placeholder = "Choose Department"
        let pv = AQPickerView()
        tf.inputView = pv
        pv.dataModel = self.myPickerData
        pv.dataCallBack = { [weak self] str in
            self?.txtDepartmentTF.text = str
        }
        return tf
    }()
    lazy var txtNameTF : AQTextField = {
        var tf = AQTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = tf.font?.withSize(15)
        tf.placeholder = "Full name"
        return tf
    }()
    lazy var txtEmailTF : AQTextField = {
        var tf = AQTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = tf.font?.withSize(15)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.placeholder = "Email address"
        return tf
    }()
    lazy var txtPhoneTF : AQTextField = {
        var tf = AQTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = tf.font?.withSize(15)
        tf.keyboardType = .numberPad
        tf.placeholder = "Phone number"
        return tf
    }()
    lazy var txtHelpTV : AQTestView = {
        var tv = AQTestView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = tv.font?.withSize(15)
        tv.placeholder = "How can we help?"
        return tv
    }()
    lazy var btnStartConversation : UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(15)
        btn.setTitle("Start Conversation", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    //Dynamic DB
    
    private var dynamicUIDB = [UIModel]()
    
    private var formModelDB = CustomFormFieldsModel(dictionary: NSDictionary()) {
        didSet {
            DispatchQueue.main.async {
                if self.dynamicUIDB.count == self.formModelDB?.customFormFields?.count{return}
                self.createUI(fields: self.formModelDB)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KeyboardManager.shared.delegate = self
        let config = AQConfig.init(accountId: "13aff")
        AQSocketManager.shared.establishConnection(config: config)
        AQSocketManager.shared.dataCallBack = { [weak self] DATA in
            if let weakself = self {
                guard let convertedFormStr = DATA.account?.settings?.formSettings?.data(using: .utf8) else{return}
                guard let formSettingsModel = try? JSONDecoder().decode(FormSettingsModel.self, from: convertedFormStr) else{return}
                weakself.formModelDB = CustomFormFieldsModel(dictionary: NSDictionary())
                if formSettingsModel.onlineFieldsVisiblility != "" {
                    if let convertedOnlineCustomFormStr = formSettingsModel.onlineFormCustomFields{
                         weakself.modelUpdate(modelStr: convertedOnlineCustomFormStr)
                    }
                }
                if formSettingsModel.offlineFieldsVisiblility != "" {
                    if let convertedOfflineCustomFormStr = formSettingsModel.offlineFormCustomFields{
                         weakself.modelUpdate(modelStr: convertedOfflineCustomFormStr)
                    }
                }
                else if formSettingsModel.onlineFieldsVisiblility == "" && formSettingsModel.offlineFieldsVisiblility == ""{
                    weakself.createUI(fields: weakself.formModelDB)
                }
            }
        }
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.layoutIfNeeded()
        var contentRect: CGRect = self.parentView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentRect.size.height = contentRect.size.height+10
        self.parentView.contentSize = contentRect.size
    }
    
    func createUI(fields:CustomFormFieldsModel?){
        
        let width = UIScreen.main.bounds.size.width
        
        self.view.addSubview(self.topView)
        self.topView.anchor(topAnchor: self.view.topAnchor, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, bottomAnchor: nil, width: width, height: 140, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0)
        
        let txtSupportLB = UILabel()
        txtSupportLB.translatesAutoresizingMaskIntoConstraints = false
        txtSupportLB.font = txtSupportLB.font.withSize(14)
        txtSupportLB.numberOfLines = 0
        txtSupportLB.textColor = .white
        txtSupportLB.textAlignment = .center
        txtSupportLB.text = "Support team"
        self.topView.addSubview(txtSupportLB)
        
        txtSupportLB.anchor(topAnchor: self.view.safeTopAnchor, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, bottomAnchor: nil, width: nil, height: nil, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 50, rightPadding: 50, bottomPadding: 0)
        
        let txtHelpLB = UILabel()
        txtHelpLB.translatesAutoresizingMaskIntoConstraints = false
        txtHelpLB.font = txtHelpLB.font.withSize(12)
        txtHelpLB.numberOfLines = 0
        txtHelpLB.textColor = .white
        txtHelpLB.text = "Ask us anything. We'd love to hear what brought you to here!"
        self.topView.addSubview(txtHelpLB)
        txtHelpLB.anchor(topAnchor: nil, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, bottomAnchor: self.topView.bottomAnchor, width: nil, height: nil, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 20, rightPadding: 20, bottomPadding: 30)
        
        self.view.addSubview(self.parentView)
        self.parentView.anchor(topAnchor: self.topView.bottomAnchor, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, bottomAnchor: self.view.safeBottomAnchor, width: width, height: nil, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 0)
        
        
        self.parentView.addSubview(self.txtDepartmentTF)
        self.txtDepartmentTF.anchor(topAnchor: self.parentView.topAnchor, leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 20, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
        
        self.parentView.addSubview(self.txtNameTF)
        self.txtNameTF.anchor(topAnchor: self.txtDepartmentTF.bottomAnchor, leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
        
        self.parentView.addSubview(self.txtEmailTF)
        self.txtEmailTF.anchor(topAnchor: self.txtNameTF.bottomAnchor, leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
        
        self.parentView.addSubview(self.txtPhoneTF)
        self.txtPhoneTF.anchor(topAnchor: self.txtEmailTF.bottomAnchor, leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
        
        self.parentView.addSubview(bgView)
        bgView.anchor(topAnchor: self.txtPhoneTF.bottomAnchor, leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
        
        bgView.addSubview(self.txtHelpTV)
        self.txtHelpTV.anchor(topAnchor: bgView.topAnchor, leftAnchor: bgView.leftAnchor, rightAnchor: bgView.rightAnchor, bottomAnchor: nil, width: nil, height: 49, centerX: nil, centerY: nil, topPadding: 0, leftPadding: 0, rightPadding: 0, bottomPadding: 1)
        
        if let allField = fields?.customFormFields {
            for (index, item) in allField.enumerated(){
                switch item.type {
                case fieldType.text.rawValue:
                    
                    let txtTF = AQTextField()
                    txtTF.translatesAutoresizingMaskIntoConstraints = false
                    txtTF.font = txtTF.font?.withSize(15)
                    txtTF.text = item.value
                    txtTF.placeholder = item.label
                    self.parentView.addSubview(txtTF)
                    txtTF.anchor(topAnchor: self.ysxisAnchor(), leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
                    let instance = UIModel.init(id: index, value: item.value ?? "", instance: txtTF, type: actionControll.textField)
                    self.dynamicUIDB.append(instance)
                    
                    break
                case fieldType.select.rawValue:
                
                let txtTF = AQTextField()
                txtTF.translatesAutoresizingMaskIntoConstraints = false
                txtTF.font = txtTF.font?.withSize(15)
                txtTF.text = item.value
                txtTF.placeholder = item.label
                let pickerView = AQPickerView()
                txtTF.inputView = pickerView
                pickerView.dataModel = item.allValues?.map({$0.label ?? ""}) ?? []
                pickerView.dataCallBack = { [weak self] str in
                    if self != nil {
                        txtTF.text = str
                    }
                }
                self.parentView.addSubview(txtTF)
                txtTF.anchor(topAnchor: self.ysxisAnchor(), leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 10, leftPadding: 10, rightPadding: 10, bottomPadding: 0)
                let instance = UIModel.init(id: index, value: item.value ?? "", instance: txtTF, type: actionControll.textField)
                self.dynamicUIDB.append(instance)
                
                break
                default:
                    break
                }
            }
        }
        
        self.parentView.addSubview(self.btnStartConversation)
        self.btnStartConversation.anchor(topAnchor: self.ysxisAnchor(), leftAnchor: self.topView.leftAnchor, rightAnchor: self.topView.rightAnchor, bottomAnchor: nil, width: nil, height: 50, centerX: nil, centerY: nil, topPadding: 50, leftPadding: 50, rightPadding: 50, bottomPadding: 0)
        self.btnStartConversation.layoutIfNeeded()
        self.btnStartConversation.backgroundColor = self.topView.backgroundColor
        self.btnStartConversation.layer.cornerRadius = self.btnStartConversation.frame.size.height/2
        self.btnStartConversation.addTarget(self, action: #selector(self.startConversation), for: .touchUpInside)
        
    }
    
    @objc func startConversation(){
        DispatchQueue.main.async {
            let AQSession = AQThreadList()
            if #available(iOS 13.0, *) {
                AQSession.modalPresentationStyle = .fullScreen
            }
            self.present(AQSession, animated: true, completion: nil)
        }
        return
        guard let department = self.txtDepartmentTF.text,department.count > 0 else {
            return presentAlert(withTitle: "Alert", message: "Please select department")
        }
        guard let name = self.txtNameTF.text,name.count > 0 else {
            return presentAlert(withTitle: "Alert", message: "Please enter your name")
        }
        guard let email = self.txtEmailTF.text,email.count > 0 else {
            return presentAlert(withTitle: "Alert", message: "Please enter your email address")
        }
        guard self.txtEmailTF.isValidEmail() else {
            return presentAlert(withTitle: "Alert", message: "Please enter your valid email address")
        }
        guard let phone = self.txtPhoneTF.text,phone.count > 0 else {
            return presentAlert(withTitle: "Alert", message: "Please enter your phone number")
        }
        guard self.txtPhoneTF.isValidPhone() else {
            return presentAlert(withTitle: "Alert", message: "Please enter your valid phone number")
        }
        
        for item in self.dynamicUIDB {
            if let indexData = self.formModelDB?.customFormFields?[item.id]{
                if let field = item.instance as? UITextField {
                    if indexData.required ?? false {
                        if field.text?.trimWhiteSpaceNewLines() == "" {
                            return presentAlert(withTitle: "Alert", message: indexData.label ?? "Please fill the field")
                        }
                    }
                }
            }
        }
        
        var mainArr = [String : Any]()
        
        self.dynamicUIDB.forEach { (item) in
            if let indexData = self.formModelDB?.customFormFields?[item.id]{
                mainArr.updateValue((item.instance as! UITextField).text ?? "", forKey: indexData.name ?? "")
            }
        }
        let textDict = ["name":self.txtNameTF.text ?? "",
                        "email":self.txtEmailTF.text ?? "",
                        "phone":self.txtPhoneTF.text ?? "",
                        "department":self.txtDepartmentTF.text ?? "",
                        "fields":mainArr] as [String : Any]
        
        AQSocketManager.shared.socket.connect()
        AQSocketManager.shared.socket.emit("visitor_details_update", textDict) {
            DispatchQueue.main.async {
                let AQSession = AQThreadList()
                if #available(iOS 13.0, *) {
                    AQSession.modalPresentationStyle = .fullScreen
                }
                self.present(AQSession, animated: true, completion: nil)
            }
        }
    }
    
}

extension AQDynamicForm {
    /// string dynamic form (offline&online availability) serialized to model
    /// - Parameter modelStr: form string
    func modelUpdate(modelStr:String) {
        guard let convertedData = modelStr.data(using: String.Encoding.ascii) else{return}
        guard let customFormArr = try? (JSONSerialization.jsonObject(with: convertedData, options: .allowFragments) as? [Any]) else{return}
        if ((self.formModelDB?.customFormFields) == nil) {
            self.formModelDB = CustomFormFieldsModel(dictionary: [fieldType.customFormFields.rawValue:customFormArr])
        } else {
            if customFormArr.count>0 {
                if let formArray =  CustomFormFieldsModel(dictionary: [fieldType.customFormFields.rawValue:customFormArr])?.customFormFields{
                self.formModelDB?.customFormFields?.append(contentsOf: formArray)
                }
            }
        }
    }
    //y axis calculation
    func ysxisAnchor() -> NSLayoutYAxisAnchor {
        let ysxisAnchor =  dynamicUIDB.count>0 ? (dynamicUIDB.count>0 && dynamicUIDB.last?.type == actionControll.textField ? (dynamicUIDB.last?.instance as! UITextField).bottomAnchor : dynamicUIDB.count>0 && dynamicUIDB.last?.type == actionControll.textView ? (dynamicUIDB.last?.instance as! UITextView).bottomAnchor : dynamicUIDB.count>0 && dynamicUIDB.last?.type == actionControll.label ? (dynamicUIDB.last?.instance as! UILabel).bottomAnchor : dynamicUIDB.count>0 && dynamicUIDB.last?.type == actionControll.image ? (dynamicUIDB.last?.instance as! UIImageView).bottomAnchor :  dynamicUIDB.count>0 && dynamicUIDB.last?.type == actionControll.button ? (dynamicUIDB.last?.instance as! UIButton).bottomAnchor : self.bgView.bottomAnchor) : self.bgView.bottomAnchor
        
        return ysxisAnchor
    }

}

//field position move up and down
extension AQDynamicForm: KeyboardManagerDelegate {
    
    func keyboardManager(_ keyboardManager: KeyboardManager, keyboardWillChangeFrame endFrame: CGRect?, duration: TimeInterval, animationCurve: UIView.AnimationOptions) {
        
        guard let endFrame = endFrame else { return }

        if endFrame.origin.y >= UIScreen.main.bounds.size.height {
            let contentInsets = UIEdgeInsets.zero
            self.parentView.contentInset = contentInsets
            self.parentView.scrollIndicatorInsets = contentInsets
        } else {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: endFrame.size.height, right: 0.0)
            self.parentView.contentInset = contentInsets
            self.parentView.scrollIndicatorInsets = contentInsets
        }
        
        UIView.animate(withDuration: duration, delay: TimeInterval(0), options: animationCurve, animations: {
            if endFrame.origin.y >= UIScreen.main.bounds.size.height {
                var contentRect: CGRect = self.parentView.subviews.reduce(into: .zero) { rect, view in
                    rect = rect.union(view.frame)
                }
                contentRect.size.height = contentRect.size.height+10
                self.parentView.contentSize = contentRect.size
            }
        }, completion: { (finished) in
            self.view.layoutIfNeeded()
        })
    }
    
}

