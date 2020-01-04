//
//  AQConstants.swift
//  ChatSdk
//
//  Created by Akash Soni on 21/11/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import Foundation
import UIKit

struct AQConstants {
    static let Defult_Socket_Url = "https://s.acquire.io"
    //static let url = "https://s.acquire.io/a-13aff"
    
    struct APP_INFO {
        static let APP_NAME: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Acquire"
        static let APP_SHORT_VERSION: String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)?.replacingOccurrences(of: ".", with: "") ?? ""
        static let APP_VERSION: String = (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? ""
        static let APP_IDENTIFIER: String = Bundle.main.bundleIdentifier ?? ""
    }
    
    struct COLOR {
        static let primary: UIColor = UIColor.init(red: 33.0/255.0, green: 44.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        static let secondary: UIColor = UIColor.init(red: 1.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: 1.0)
        static let background: UIColor = UIColor.init(red: 248.0/255.0, green: 249.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        static let placeholderBody: UIColor = UIColor.init(red: 187.0/255.0, green: 190.0/255.0, blue: 190.0/255.0, alpha: 1.0)
        static let darkBody: UIColor = UIColor.init(red: 45.0/255.0, green: 49.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        static let separator: UIColor = UIColor.gray
        static let buttonShadow = UIColor(red: 27 / 255, green: 71 / 255, blue: 219 / 255, alpha: 0.3)
    }
    
    struct DEVICE {
        static let OS_VERSION: String = UIDevice.current.systemVersion
        static let OS: String = UIDevice.current.systemName
        static let MODEL: String = UIDevice.current.localizedModel
    }
    
    struct UserDefault {
        static let visitHash = "visitHash"
        static let visitorHash = "visitorHash"
    }
}

struct AQConfig {
    
    var socketUrl: URL!
    var accountId: String!
    
    init(socketURL: URL = URL.init(string: AQConstants.Defult_Socket_Url)!, accountId: String) {
        self.socketUrl = socketURL
        self.accountId = accountId
    }
    
    internal func isValid() -> Bool {
        if accountId.trimWhiteSpaceNewLines().isEmpty {
            return false
        }
        return true
    }
}
