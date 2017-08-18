//
//  UIImage+Extensions.swift
//  magic
//
//  Created by SteveLin on 2017/6/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation

extension UIImage {
    class func image(color:UIColor) -> UIImage {
        return UIImage.image(with: color, frame: CGRect(x: 0, y: 0, width: 1, height: 1))
    }
    
    class func image(with color:UIColor, frame:CGRect) -> UIImage {
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }

}
