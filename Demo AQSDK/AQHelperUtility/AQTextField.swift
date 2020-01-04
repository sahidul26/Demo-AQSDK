//
//  AQTextField.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 01/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class AQTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame:frame)
        self.setBottomBorder()
        self.addDoneButtonOnKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tintColor = AQConstants.COLOR.primary

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction() {
        self.resignFirstResponder()
        if let scroll = self.superview as? UIScrollView {
            let contentInsets = UIEdgeInsets.zero
            scroll.contentInset = contentInsets
            scroll.scrollIndicatorInsets = contentInsets
        }
    }
    
}
