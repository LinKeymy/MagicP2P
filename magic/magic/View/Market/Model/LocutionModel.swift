//
//  LocutionModel.swift
//  magic
//
//  Created by SteveLin on 2017/5/9.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class LocutionModel: NSObject {
    var question:String?
    var answer:String?
    override var description: String {
        return yy_modelDescription()
    }
}


extension LocutionModel:IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? LocutionModel else { return false }
        return self.question == object.question && self.answer == object.answer
    }
}
