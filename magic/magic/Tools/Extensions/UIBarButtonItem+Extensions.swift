//
//  UIBarButtonItem+Extensions.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//
import UIKit

extension UIBarButtonItem {

    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector, isBack: Bool = false) {
        let btn = UIButton(title: title,fontSize: 16, normalColor: UIColor.darkGray, hightligtedColor: UIColor.orange)
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named: imageName), for: UIControlState(rawValue: 0))
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
    
    convenience init(imageName: String, target: Any?, action: Selector?) {
        self.init(image: UIImage(named:imageName), style: .plain, target: target, action: action)
    }
}


extension UIButton {

    convenience init(title:String?,fontSize:CGFloat = 17, normalColor:UIColor?,hightligtedColor:UIColor?,backgroundImageName:String? = nil) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(normalColor, for: .normal)
        setTitleColor(hightligtedColor, for: .highlighted)
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        if let name = backgroundImageName {
            setBackgroundImage(UIImage(named:name), for: .normal)
        }
        self.sizeToFit()
    }
}
