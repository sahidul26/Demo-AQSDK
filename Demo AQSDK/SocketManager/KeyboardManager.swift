//
//  KeyboardManager.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 01/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class KeyboardManager {
  
  // MARK: - Static Variables
  
  static let shared = KeyboardManager()
  
  // MARK: - Variables
  
  weak var delegate: KeyboardManagerDelegate?
  
  // MARK: - Init
  
  init() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  // MARK: - Functions
  
  @objc private func keyboardWillChangeFrame(notification: Notification) {
    guard let userInfo = notification.userInfo else { return }
    
    let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
    let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
    let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseOut.rawValue
    let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
    
    delegate?.keyboardManager(self, keyboardWillChangeFrame: endFrame, duration: duration, animationCurve: animationCurve)
  }
  
  @objc private func keyboardWillHide(notification: Notification) {
    guard let userInfo = notification.userInfo else { return }
    delegate?.keyboardWillHide?(userInfo: userInfo)
  }
}
