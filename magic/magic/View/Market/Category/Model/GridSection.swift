//
//  GridSection.swift
//  magic
//
//  Created by SteveLin on 2017/5/31.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class GridItem: NSObject {
    var title: String?
    var detailText: String?
    var icon: String?
    var uri: String?
}



extension GridItem: IGListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else {
            return true
        }
        if let obj = object as? GridItem,
            let stilte  = self.title,
            let otitle = obj.title {
            return stilte == otitle && self.isEqual(object)
        }
        return false
    }
}

