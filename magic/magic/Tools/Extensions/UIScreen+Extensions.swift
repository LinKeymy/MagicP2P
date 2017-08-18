//
//  UIScreen+Extensions.swift
//  magic
//
//  Created by SteveLin on 2017/7/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


extension UIScreen {
    open class var width : CGFloat {
        return UIScreen.main.bounds.width
    }
    
    open class var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    open class var t_scale: CGFloat {
        return UIScreen.main.scale
    }

}
