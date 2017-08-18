//
//  BaseViewConstroller.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavgationBar()
    }
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: 64))
    lazy var navItem = UINavigationItem()
    
    override var title: String? {
        didSet{
            navItem.title = title
        }
    }
}


extension BaseViewController {
    
    
    fileprivate  func setupNavgationBar() {
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        //背景色
        navigationBar.barTintColor = UIColor(red: 13/255.0, green: 95/255.0, blue: 171/255.0, alpha: 1) // bar的背景色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white] // 中间title的字体色
        navigationBar.tintColor = UIColor.white //barbuttonItem的文字渲染色
    }
}


