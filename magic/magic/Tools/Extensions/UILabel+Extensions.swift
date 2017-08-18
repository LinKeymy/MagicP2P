//
//  UILabel+Extensions.swift
//  magic
//
//  Created by SteveLin on 2017/7/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


extension UILabel {
   convenience init(text:String, fontSize:CGFloat = 17, color:UIColor = UIColor.black) {
        self.init()
        self.text = text
        font = UIFont.systemFont(ofSize: fontSize);
        textColor = color;
        numberOfLines = 0;
        sizeToFit()
    }

}
