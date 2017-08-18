//
//  UIView+Extentions.swift
//  magic
//
//  Created by SteveLin on 2017/6/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation


extension UIView {

    @IBInspectable var borderColor:UIColor? {
        set (newValue) {
           self.layer.borderColor = newValue?.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
    
    @IBInspectable var borderWidth:CGFloat {
        set (newValue) {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set (newValue) {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true;
//            self.layer.rasterizationScale = UIScreen.cz_scale()
//            self.layer.shouldRasterize = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
}


extension UIView {
    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}


