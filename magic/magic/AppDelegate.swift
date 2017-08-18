//
//  AppDelegate.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

let TZJUserSignInSuccess = "TZJUserSignInSuccess"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notificationHandler = NotificationHandler()

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.clear
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
        Router.engineStart()
        notificationHandler.register(options:launchOptions)
        return true
    }
    
    private func getRootViewController() -> UIViewController {
        return RootViewController()
  }
}


extension AppDelegate {
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if let scheme =  url.scheme {
            if scheme.hasPrefix(AppRouteScheme) {
                if let sourceId = sourceApplication  {
                    if !(sourceId == Bundle.main.boudleId)  {
                      return false
                    }
                }
                return Router.routeURL(url)
            }
        }
        return true
    }
}
