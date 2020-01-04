//
//  KeyboardManagerDelegate.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 01/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

typealias KeyboardManagerDelegate = KeyboardManagerDelegateRequired & KeyboardManagerDelegateOptional

protocol KeyboardManagerDelegateRequired: class {
    func keyboardManager(_ keyboardManager: KeyboardManager, keyboardWillChangeFrame endFrame: CGRect?, duration: TimeInterval, animationCurve: UIView.AnimationOptions)
}

@objc protocol KeyboardManagerDelegateOptional {
  @objc optional func keyboardWillHide(userInfo: [AnyHashable: Any])
}
