//
//  AQSocketManager.swift
//  ChatSdk
//
//  Created by Akash Soni on 21/11/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit
//import SocketIO



class AQSocketManager: NSObject {

    static let shared =  AQSocketManager()
    fileprivate var currentVC: UIViewController!
    var imagePickedBlock: ((String) -> Void)?
    var dataCallBack: ((SocketDetailsModel) -> Void)?
    var manager: SocketManager?
    var socket: SocketIOClient!
    var configuration: AQConfig!
    
    override init() {
        super.init()
    }
    
     // MARK:- Socket Connection Establish
    func establishConnection(config: AQConfig) {
        configuration = config
        let socketPath = "/a-\(config.accountId!)"
        manager = SocketManager(socketURL: config.socketUrl, config: [.log(true), .path(socketPath), .reconnects(true), .forceWebsockets(true)])
        socket = manager?.defaultSocket
        
        debugPrint("establishConnection")
        socket?.connect()
        self.connected()
    }
    
    func connected() {
        socket?.on(clientEvent: .connect) {data, ack in
            debugPrint("socket connected")
            self.startSessionEmitter(sessionInfo: self.prepareSessionInfo())
        }
    }
    
    func closeConnection() {
        debugPrint("closeConnection")
        socket?.disconnect()
    }
    
    func disconnected() {
        socket?.on("disconnect"){
            data, ack in
        }
    }
    
    func reconnecting() {
        debugPrint("reconnecting")
        self.socket?.on("connect"){ data, ack in
        }
    }
    
    // MARK:- Socket All Emitters
    func startSessionEmitter(sessionInfo: [Any]) {
        let socketConnectionStatus = socket!.status
        switch socketConnectionStatus {
            
        case SocketIOStatus.connecting:
            debugPrint("socket connecting")
        case SocketIOStatus.disconnected:
            debugPrint("socket disconnected")
        case SocketIOStatus.notConnected:
            debugPrint("socket not connected")
        case SocketIOStatus.connected:
            debugPrint("start_session")
            self.socket?.emitWithAck("start_session", with: sessionInfo).timingOut(after: 0, callback: { (data) in
                
                guard let lastValue = data.last else { return }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: lastValue, options: []) else {
                    fatalError("something went wrong with startSession object.")
                }
                guard let responseModel = try? JSONDecoder().decode(SocketDetailsModel.self, from: jsonData) else{return}
                responseModel.storeHashDetailsInUserDefaults()
                self.dataCallBack?(responseModel)
            })
        }
    }
    
    // MARK:- Socket All Listener
    func startSessionListener(requestBookingCompletionHandler: @escaping (NSDictionary)->()) {
        socket?.on("start_session") { ( dataArray, ack) -> Void in
            debugPrint(dataArray.first!)
            requestBookingCompletionHandler(dataArray.first! as! NSDictionary)
        }
    }
}


extension AQSocketManager {
    private func prepareSessionInfo()->[Any] {
        let clientInfo = [
            "client":[
                "id": 1,
                "cobrowse_code": nil,
                "version": 58,
                "name" : "ios"//K.APP_INFO.APP_NAME,
            ],
            "api":[
                "version":58
            ]
        ]
        let otherInfo: [String : Any?] = [
            "auth" : nil,
            "chat_invitaion_code": false,
            "details":[
                "name":""
            ],
            "ip" : "",
            "virtual":false,
            "page":[
                "ref" : "",
                "title":AQConstants.APP_INFO.APP_NAME,
                "url": AQConstants.APP_INFO.APP_IDENTIFIER
            ],
            "ua":[
                "device" :[
                    "model":"ios",
                    "type": "mobile",
                    "vendor":"Apple"
                ],
                "engine":[
                    "name":AQConstants.APP_INFO.APP_NAME,
                    "version":AQConstants.APP_INFO.APP_VERSION
                ],
                "cpu":[
                    "architecture":""
                ],
                "browser":[
                    "name":"SDK",
                    "version": AQConstants.APP_INFO.APP_VERSION
                ],
                "os" :[
                    "name":AQConstants.DEVICE.OS,
                    "version":AQConstants.DEVICE.OS_VERSION
                ],
                "app":[
                    "version": AQConstants.APP_INFO.APP_SHORT_VERSION,
                    "build":AQConstants.APP_INFO.APP_VERSION,
                    "universal": false
                ],
                "ua":AQConstants.DEVICE.MODEL
            ],
            "visitHash": UserDefaults.standard.value(forKey: AQConstants.UserDefault.visitHash) ?? "",
            "visitorHash": UserDefaults.standard.value(forKey: AQConstants.UserDefault.visitorHash) ?? ""
        ]
        return [clientInfo, self.configuration.accountId!, otherInfo, false] //client info, uid, other info, resume
    }
}

extension AQSocketManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    func presentCamera(for view: UIViewController)
    {
        currentVC = view
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            currentVC.present(myPickerController, animated: true, completion: nil)
        }
        
    }
    
    func presentPhotoLibrary(for view: UIViewController)
    {
        currentVC = view
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            currentVC.present(myPickerController, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

   
        switch picker.sourceType {
       
        case .photoLibrary:
            if #available(iOS 11.0, *) {
                self.imagePickedBlock?("\(String(describing: info[UIImagePickerController.InfoKey.imageURL]!))")
            } else {
                
            }
        case .camera:
            guard let image = info[.originalImage] as? UIImage else {
                          print("No image found")
                          return
                      }
                      saveImage(image: image) { (error) in
                          print("saveImage not found")
                      }
        case .savedPhotosAlbum:
            if #available(iOS 11.0, *) {
                self.imagePickedBlock?("\(String(describing: info[UIImagePickerController.InfoKey.imageURL]!))")
            } else {}
        @unknown default:
            break
        }
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    
   
    
    func saveImage(image: UIImage, completion: @escaping (Error?) -> ()) {
       UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(path:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc private func image(path: String, didFinishSavingWithError error: NSError?, contextInfo: UnsafeMutableRawPointer?) {
        debugPrint(path) // That's the path you want
    }
   
}
