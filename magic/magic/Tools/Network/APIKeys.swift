//
//  APIKeys.swift
//  magic
//
//  Created by SteveLin on 2017/5/25.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation

private let minimumKeyLength = 2


struct APIKeys {
    let key:String
    let secret:String
    
    fileprivate struct SharedKeys {
        static var instance = APIKeys(key: "hh", secret: "kk")
    }
    
    static var sharedKeys:APIKeys {
        get {
            return SharedKeys.instance
        }
        set (newSharedKeys) {
            SharedKeys.instance = newSharedKeys
        }
    }
    
    // 判断是否需要stub
    var stubResponses:Bool {
        return false
    }
    
    
    init(key:String, secret:String) {
        self.key = key
        self.secret = secret
    }
    
}


