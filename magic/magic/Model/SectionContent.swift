//
//  SectionContent.swift
//  magic
//
//  Created by SteveLin on 2017/6/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit
import SwiftyJSON

class SectionContent {
    //这个id非常重要，IGListKit的 diffIdentifier 就是由它来标示，id相同的内容不会重复出现在集合视图中
    var id: Int
    var title: String
    var list: [IGListDiffable]
    var rightEntry: String?
    var desc: String?
    var contenType: String
    var isShowHeader: Bool = false
    var itemh: CGFloat = 44
    var itemw: CGFloat = kScreenW
    
    required init(id:Int, title: String, list: [IGListDiffable], isShowHeader: Bool = false, cocontenType: String, rightEntry: String?,itemh: CGFloat = 44,itemw: CGFloat = kScreenW) {
        self.id = id
        self.title = title
        self.list = list
        self.rightEntry = rightEntry
        self.contenType = cocontenType
        self.isShowHeader = isShowHeader
        self.itemh = itemh
        self.itemw = itemw
    }
    
}

extension SectionContent:sectionType {
    var type: AnyClass {
        return conType.type
    }
    
    var conType: ContentType {
        return ContentType(rawValue: contenType) ?? ContentType.bid
    }
}

extension SectionContent: Modelable {
    open class func model(with dictionary: [AnyHashable : Any]) -> Self? {
        
        let json = JSON(dictionary)
        
        guard let list = json["list"].array,
            let ct = json["contenType"].string,
            let ctype =  ContentType(rawValue: ct) else {
                return nil
        }
        var temp = [IGListDiffable]()
        for js in list {
            if let jsOb = js.dictionaryObject,
                let obj = ctype.type.yy_model(with: jsOb) as? IGListDiffable {
                temp.append(obj)
            }
        }
        if temp.isEmpty { return  nil }
        let title = json["title"].stringValue
        let rightentry = json["rightEntry"].string
        let id = json["id"].intValue
        let isshow = json["isShowHeader"].boolValue
        let desc = json["desc"].string
        let sec = self.init(id:id, title:title, list: temp,isShowHeader:isshow, cocontenType: ct, rightEntry: rightentry)
        sec.desc = desc
        if let itemh = json["itemh"].double,
            let itemw = json["itemw"].double {
            sec.itemh = CGFloat(itemh)
            sec.itemw = CGFloat(itemw)
        }
        return sec
    }
}

extension SectionContent: IGListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? SectionContent else { return false }
      return self.contenType == object.contenType && (self.list as NSArray).isEqual(toDiffableObject:(object.list as NSArray)) && (self.title == object.title)
        
    }
}

