//
//  Bid.swift
//  magic
//
//  Created by SteveLin on 2017/6/16.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class Bid: NSObject {
    var amount: Int = 0
    var investId: String = "0"
    var remainAmount: Int = 0
    var investUniqueId: String?
    var investName: String?
    var platEnName: String?
    var platCnName: String?
    var totalRate: CGFloat = 0.0
    var period: Int = 0
    var periodUnit: String?
    var todayHot:Bool = false
    var weaklyBest:Bool = false
    var uri:String?
}

extension Bid: IGListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? Bid else { return false }
        return self.investId == object.investId
    }
}
