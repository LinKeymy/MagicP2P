//
//  ColorConfig.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

/// 对于常用的颜色的使用全局模块定义，之前的全局单个变量过于散乱，命名也过于麻烦

/// 用于黑色文字的颜色
struct Gray {
    static let ultraLight = THexColor("000000", 0.40)
    static let thin       = THexColor("000000", 0.50)
    static let light      = THexColor("000000", 0.60)
    static let regular    = THexColor("000000", 0.80)
    static let medium     = THexColor("000000", 0.85)
    static let bold       = THexColor("000000", 0.90)
    static let heavy      = THexColor("000000", 0.95)
    static let black      = THexColor("000000", 1.00)
}

/// 背景色
struct Background {
    static let table      = THexColor("EBEBF1")
    static let page       = THexColor("f2f2f2")
    static let seperator  = THexColor("BEBECC")
    static let header     = THexColor("f7f7f7")
}


/// 标的的颜色
struct BidColor {
    static let rate       = THexColor("FF8A10")
    static let period     = Gray.regular
    static let amount     = Gray.regular
}

/// 一些控件的对其内容的染色
struct TinColor {
   static let button      = THexColor("007AFF") ?? UIColor.black
}
