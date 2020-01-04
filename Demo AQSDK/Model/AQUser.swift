//
//  AQChatViewController.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 28/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

struct AQUser: Equatable {
    let name: String
    let userId: String
}
struct AQMessageStatus: Equatable {
  let isSend: Bool
  let isDelivered: Bool
  let isRead: Bool
}
