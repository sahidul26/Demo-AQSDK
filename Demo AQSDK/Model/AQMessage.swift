//
//  AQChatViewController.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 28/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

struct AQMessage {
  let user: AQUser
  let status: AQMessageStatus
  let content: String
  let sentAt: Double
  let messageType: MessageType
  let imageUrl: String
  let isIncoming: Bool
}

extension AQMessage {
    init(_ content: String,_ imageUrl: String,_ sentAt: Double,_ isIncoming: Bool) {
        self.messageType = MessageType.unknown
        self.user = AQUser(name: content, userId: "13aff")
        self.status = AQMessageStatus(isSend:false, isDelivered: false, isRead: false)
        self.sentAt = sentAt
        self.content = content
        self.imageUrl = imageUrl
        self.isIncoming = isIncoming
    }
}
enum MessageType {
    case text
    case image
    case unknown
}
