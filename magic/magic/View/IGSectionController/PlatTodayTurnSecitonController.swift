//
//  PlatTodayTurnSecitonController.swift
//  magic
//
//  Created by SteveLin on 2017/6/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit




class PlatTodayTurnSecitonController: IGListSectionController, IGListSectionType {
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
    }
    
    var data:SectionContent?
    
    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 144, height: 175)
    }

    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "PlatTodayTurnoverCell", bundle: nil, for: self, at: index) as! PlatTodayTurnoverCell
        nibCell.platform = data?.list[index] as? PlatTodayTurnover
        return nibCell
    }
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
        deLog("didUpdate:\(object)")
    }
    
    func didSelectItem(at index: Int) {
        deLog("didSelectItem")
    }
    
}

