//
//  Message.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class Message: NSObject {
    var createAt: String?
    var id: Int = 0
    var dir: Int = 0
    var contents: [MessageContent]?
    
    class func modelContainerPropertyGenericClass() -> [String:Any] {
        return ["contents":MessageContent.self]
    }
}
