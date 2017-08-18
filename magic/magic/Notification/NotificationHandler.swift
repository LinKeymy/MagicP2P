//
//  Notification.swift
//  magic
//
//  Created by SteveLin on 2017/6/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import UserNotifications


class NotificationHandler: NSObject {
    // 注册通知
    func register(options:[UIApplicationLaunchOptionsKey: Any]?) {
        UMessage.start(withAppkey: "55b5fd4167e58e5de3002fa6", launchOptions: options)
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert,.badge,.sound]) { (resopne, error) in }
            center.delegate = self
        } else {
            // TODO
        }
        UMessage.registerForRemoteNotifications()
        UMessage.setLogEnabled(true)
    }
}

extension NotificationHandler: UNUserNotificationCenterDelegate {
    // 收到通知
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didReceive notification:\(response)")
        UMessage.didReceiveRemoteNotification(response.notification.request.content.userInfo)
    }
    // 即将展示
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("willPresent notification:\(notification.request.content.userInfo)")
    }
}

extension AppDelegate {

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("didReceiveRemoteNotification userinfo: \(userInfo)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.base64EncodedString().replacingOccurrences(of: "<", with: ">").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        print("deviceToken:\(token)")
    }
}

