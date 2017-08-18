//
//  SelectedTotalAssets.swift
//  magic
//
//  Created by SteveLin on 2017/5/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class SelectedTotalAssets: NSObject {
    var updatedAt:String?
    var totalAmount:Double = 0
    var balanceAmount:Double = 0
    var list:[SelectedAssets]?
    
    class func modelContainerPropertyGenericClass() -> [String:Any] {
        return ["list":SelectedAssets.self];
    }
}


