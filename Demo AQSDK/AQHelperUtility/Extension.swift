//
//  Extension.swift
//  Acquire-sdk
//
//  Created by Akash Soni on 26/11/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func trimWhiteSpaceNewLines() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

extension UIView {
    func anchor(topAnchor:NSLayoutYAxisAnchor?,leftAnchor:NSLayoutXAxisAnchor?,rightAnchor:NSLayoutXAxisAnchor?,bottomAnchor:NSLayoutYAxisAnchor?,width:CGFloat?,height:CGFloat?,centerX:NSLayoutXAxisAnchor?,centerY:NSLayoutYAxisAnchor?,topPadding:CGFloat,leftPadding:CGFloat,rightPadding:CGFloat,bottomPadding:CGFloat){
        if let topAnchor = topAnchor{
            self.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        }
        if let leftAnchor = leftAnchor{
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: leftPadding).isActive = true
        }
        if let rightAnchor = rightAnchor{
            self.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightPadding).isActive = true
        }
        if let bottomAnchor = bottomAnchor{
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding).isActive = true
        }
        if let width = width{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let centerX = centerX{
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY{
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        return self.topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }
        return self.leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }
        return self.rightAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        return self.bottomAnchor
    }
    var safeAreaBottom: CGFloat {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.layoutFrame.maxY
        }
        return self.readableContentGuide.layoutFrame.maxY
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat, withBackgroundColor: String) {
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = corners
        } else {
            // Fallback on earlier versions
        }
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = AQConstants.COLOR.primary
    }
}
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.text)
    }
    func isValidPhone() -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneTest.evaluate(with: self.text) && self.text?.count ?? 0 > 4 {
            return true
        }
        return false
    }

}
extension UITextView {
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
extension UIViewController {

  func presentAlert(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
class UIModel{
    var id: Int
    var value: String
    var instance: Any
    var type: actionControll? = .unknown
    init(id: Int, value: String, instance:Any, type: actionControll? = .unknown) {
        self.instance = instance
        self.type = type
        self.id = id
        self.value = value
    }
}

enum actionControll{
    case label
    case textField
    case image
    case textView
    case button
    case unknown
}
enum fieldType:String {
    case text
    case select
    case textview
    case customFormFields
}
extension CALayer {
  func addShadow(color: UIColor, offset: CGSize, radius: CGFloat) {
    shadowColor = color.cgColor
    shadowOffset =  offset
    shadowRadius = radius
    shadowOpacity = 1
  }
  
    func addBottomBorder(color: UIColor = AQConstants.COLOR.separator, width: CGFloat = 1) {
    let borderLayer = CALayer()
    borderLayer.frame = CGRect(
      x: 0,
      y: frame.height - 1,
      width: frame.width,
      height: width)
    borderLayer.backgroundColor = color.cgColor
    addSublayer(borderLayer)
  }
}
