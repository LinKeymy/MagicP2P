//
//  PlatBaseInfo.swift
//  magic
//
//  Created by SteveLin on 2017/6/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import YYModel
import IGListKit

//class PlatBaseInfo: NSObject {
//{
//    "platEnName": "renrendai",
//    "platCnName": "人人贷",
//    "maxRate": 9.6,
//    "minRate": 4,
//    "startDeadline": 31,
//    "startDeadlineUnit": "天",
//    "endDeadline": 730,
//    "endDeadlineUnit": "天",
//    "creditLevel": "AAA",
//    "isRecommend": true,
//    "logo": "http://static.touzhijia.com/m/platforms/recommend/renrendai.png",
//    "activityFlag": false,
//    "tags": [
//    "风投系",
//    "有存管"
//    ],
//    "tradeVolume": 123.95,
//    "avgRate": 10.17,
//    "showQuickInvestTag": false,
//    "uri": "http://m2.touzhijia.com/platform/detail/renrendai"
//    }
//}


class PlatBaseInfo :NSObject {
    var endDeadlineUnit: String?
    var maxRate: CGFloat = 0.0
    var uri: String?
    var platCnName: String?
    var minRate: Int = 0
    var tags: [String]?
    var tradeVolume: CGFloat = 0.0
    var isRecommend: Bool = false
    var endDeadline: Int = 0
    var startDeadline: Int = 0
    var logo: String?
    var showQuickInvestTag: Bool = false
    var creditLevel: String?
    var platEnName: String = "touzhijia"
    var startDeadlineUnit: String?
    var activityFlag: Bool = false
    var avgRate: CGFloat = 0.0
}


extension PlatBaseInfo: IGListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.platEnName as NSObjectProtocol
    }
    
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? PlatBaseInfo else { return false }
        return self.platEnName == object.platEnName
    }
}
