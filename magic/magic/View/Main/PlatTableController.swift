//
//  PlatTableController.swift
//  magic
//
//  Created by SteveLin on 2017/5/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatTableController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewController()
        view.backgroundColor = UIColor.white
        delegate = self
        title = "直投理财"
        let btn = UIButton(type: .infoLight)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        btn.addTarget(self, action: #selector(showSomething), for: .touchUpInside)
//        delay(0.5) {
//            self.show(alert: "这里希望做成平台的app的形式(也可以理解为小程序的形式)，有三个tab模块:1,平台的标的，2.平台的资讯（或者叫发现什么的 whatever），3.平台的个人中心(或许相当于快捷？)")
//        }

    }
    
    func showSomething() {
       let vc = UIViewController()
        vc.title = "详细资料"
        vc.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(vc, animated: true)
    }

}


// MARK: - ChildControllers
extension PlatTableController {
    
    fileprivate func setupChildViewController() {
        guard let path = Bundle.main.path(forResource: "plat.json", ofType: nil),
            let data = NSData(contentsOfFile: path),
            let array = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String : AnyObject]] else {
                return;
        }
        var mArray = [UIViewController]()
        for dict in array! {
            mArray.append(controller(dict: dict))
        }
        viewControllers = mArray
    }
    
    private  func controller(dict:[String:AnyObject]) -> UIViewController {
        guard let clsName = dict["clsName"] as? String,
            let title  = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
                return UIViewController()
        }
        let viewController = cls.init()
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: imageName + "_normal")
        viewController.tabBarItem.selectedImage = UIImage(named: imageName + "_push")?.withRenderingMode(.alwaysOriginal)
        return viewController
    }
    
}


extension PlatTableController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        tabBarController.title = 
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }

}
