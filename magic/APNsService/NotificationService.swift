//
//  NotificationService.swift
//  APNsService
//
//  Created by SteveLin on 2017/6/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        print("oooobestAttemptContent?.userInfo:\(String(describing: bestAttemptContent?.userInfo))")
        guard let dict = bestAttemptContent?.userInfo["aps"] as? [String:Any],
            let attachUrl = dict["image"] as? String,
            let  url = URL(string: attachUrl) else {
                return
        }
          print("url:\(url)")
        URLSession.shared.downloadTask(with:url) { (url, respone, eror) in
            guard let caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last,
                let fileName = respone?.suggestedFilename else {
                  
                return
            }
              print("fileName:\(fileName)")
            let file = (caches as NSString).appendingPathComponent(fileName)
            print("file:\(file)")
            try? FileManager.default.moveItem(atPath: (url?.path)!, toPath: file)
            
            if file != "" {
                if let url = URL(string: "file://".appending(file)),
                let att = try? UNNotificationAttachment(identifier: "photo", url: url, options: nil) {
                   self.bestAttemptContent?.attachments = [att]
                }
            }
            if let bestAttemptContent = self.bestAttemptContent {
                bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
                contentHandler(bestAttemptContent)
            }
        }.resume()
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}

