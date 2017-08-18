//
//  Bundle+Extensions.swift
//  反射机制
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 SteveLin. All rights reserved.
//

import Foundation

extension Bundle {
    // 计算型属性类似于函数，没有参数，有返回值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    var boudleId:String {
        return infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
    var appVersion:String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
}
