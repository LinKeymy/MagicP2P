//
//  Array+Extensions.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import IGListKit


extension Array where Element == [String:Any] {
    func mapModels<T:NSObject>(type:T.Type) -> [T] {
        var tempArray = [T]()
        for item in self {
            if let model = type.yy_model(with: item) {
                tempArray.append(model)
            }
        }
        return tempArray
    }
}

extension NSArray:IGListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? NSArray else { return false }
        guard let objf = object.firstObject as? IGListDiffable,
        let objs = self.firstObject as? IGListDiffable else {
        return false
        }
        return self.count == object.count && objf.isEqual(toDiffableObject:objs) }
}


extension Array  {
    // 讲一个数组按照其元素的关系，切分为多个数组的二维数组
    func divideMap( _ condition:(Element,Element) -> Bool) -> [[Element]] {
        var result: [[Element]] = []
        var match: [Element] = []
        var unMatch: [Element] = self
        while unMatch.count > 0 {
            let firstValue = unMatch[0]
            match = unMatch.filter{ e in return condition(firstValue,e) }
            unMatch = unMatch.filter{ e in return !condition(firstValue,e) }
            result.append(match)
        }
        return result
    }
}
