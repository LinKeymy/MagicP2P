//
//  NavigationController.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.isHidden = true
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
//            if let vc = viewController as? BaseViewController {
//                let title = viewControllers.count == 1 ? childViewControllers.first?.title : "返回"
//                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title!, target: self, action: #selector(popBack),isBack:true)
//            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    

}
