//
//  MessageSource.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class MessageSource: NSObject {
    
    var head: String?
    var icon: String?
    var name: String?
    var id: String?
    var messages: [Message]?
    var unread: Int? = 0
    
    class func modelContainerPropertyGenericClass() -> [String:Any] {
        return ["messages":Message.self];
    }
}
