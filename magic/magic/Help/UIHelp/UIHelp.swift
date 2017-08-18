//
//  UIHelp.swift
//  magic
//
//  Created by SteveLin on 2017/5/23.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import UIKit


func currentViewController(window:UIWindow? = UIApplication.shared.delegate?.window ?? nil ) -> UIViewController? {
    var currentVc:UIViewController? = nil
    guard let rootVc = window?.rootViewController else {
        return nil
    }
    var presentVc:UIViewController? = rootVc
    repeat {
        if  let prc = presentVc {
            if !(prc.isKind(of: UINavigationController.self) || prc.isKind(of: UITabBarController.self)) {
                currentVc = prc
                presentVc = prc.presentedViewController
            }
        }
        if let prc = presentVc as? UINavigationController {
            currentVc = prc.viewControllers.last
            presentVc = prc.presentedViewController
        }
        if let prc = presentVc as? UITabBarController {
            currentVc = prc
            presentVc = prc.selectedViewController
        }
        
    } while presentVc != nil
    return currentVc
}
