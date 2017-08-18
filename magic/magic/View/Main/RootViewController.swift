//
//  RootViewController.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import SVProgressHUD

let UserShouldLoginNotification = "UserShouldLoginNotification"

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupChildViewController()
        if !UserAccount.isLogon {
            userLogin(note: nil)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(userLogin), name: NSNotification.Name(rawValue: UserShouldLoginNotification), object: nil)
    }
    
    @objc private func userLogin(note:Notification?) {
        print("接收用户登录通知:\(String(describing: note))")
        var when = DispatchTime.now()
        if note?.object != nil {
            SVProgressHUD.setDefaultMaskType(.gradient)
            SVProgressHUD.showInfo(withStatus: "登录已经超时，请重新登录")
            when = DispatchTime.now() + 2
        }
        DispatchQueue.main.asyncAfter(deadline:when) {
            SVProgressHUD.setDefaultMaskType(.clear)
            let vc = UIStoryboard(name: "LoginView", bundle: nil).instantiateInitialViewController()!
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}



// MARK: - ChildControllers
extension RootViewController {
    
    fileprivate func setupChildViewController() {
        guard let array = objectFromMainBundle(fileName: "main.json") as? [[String : AnyObject]] else {
            return
        }
        var mArray = [UIViewController]()
        for dict in array {
            mArray.append(controller(dict: dict))
        }
        viewControllers = mArray
    }
    
    private  func controller(dict:[String:AnyObject]) -> UIViewController {
        guard let clsName = dict["clsName"] as? String,
            let title  = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? BaseViewController.Type else {
                return UIViewController()
        }
        let viewController = cls.init()
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: imageName + "_normal")
        viewController.tabBarItem.selectedImage = UIImage(named: imageName + "_push")?.withRenderingMode(.alwaysOriginal)
        let nav = NavigationController(rootViewController: viewController)
        return nav
    }
    
}
