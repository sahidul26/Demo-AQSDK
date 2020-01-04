//
//  AQTextView.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 07/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class AQTestView: UITextView,UITextViewDelegate {
    
    var placeholder = String() {
        didSet{
            self.text = placeholder
        }
    }
   var dataCallBack: ((CGFloat) -> Void)?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setBottomBorder()
        addDoneButtonOnKeyboard()
        self.textContainerInset.left = -5
        self.textContainerInset.top = 15
        self.delegate = self
        self.textColor = UIColor.lightGray
        
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.text == placeholder
        {
            self.text = nil
            self.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if self.text.isEmpty
        {
            self.text = placeholder
            self.textColor = UIColor.lightGray
        }
    }
    
}
