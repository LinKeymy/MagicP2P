//
//  SelectedAssets.swift
//  magic
//
//  Created by SteveLin on 2017/5/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit


class SelectedAssets: NSObject {
    
    var platEnName:String?
    var platCnName:String?
    var awaitAmount:Double = 0
    var totalAmount:Double = 0
    var balanceAmount:Double = 0
    var updatedAt:String?
    var awaitAmountPercent:Double = 0
    var uri:String?

}

extension SelectedAssets: IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
