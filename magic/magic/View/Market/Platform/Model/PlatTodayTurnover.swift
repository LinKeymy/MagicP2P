//
//  PlatTodayTurnover.swift
//  magic
//
//  Created by SteveLin on 2017/6/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class PlatTodayTurnover: NSObject {
    var tradeAmount: String?
    var squareLogo: String?
    var averageRate: String?
    var platEnName: String?
    var top: Int = 0
    var platTag: String?
    var logoLabel: String?
    var platCnName: String?
}

extension PlatTodayTurnover: IGListDiffable {
        func diffIdentifier() -> NSObjectProtocol {
            return self.top as NSObjectProtocol
    }
        
        func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
            guard self !== object else { return true }
            guard let object = object as? PlatTodayTurnover else { return false }
            return self.top == object.top
        }
}
