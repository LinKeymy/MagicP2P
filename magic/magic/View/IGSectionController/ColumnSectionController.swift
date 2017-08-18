//
//  ColumnSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/20.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class ColumnSectionController: IGListSectionController, IGListSectionType {
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.minimumLineSpacing = 10
    }
    
    var data: SectionContent?
    
    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        if let h = data?.itemh ,
            let w = data?.itemw {
            return CGSize(width: w, height: h)
        }
        return CGSize(width: 128, height: 241)
    }

    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "ColumnCell", bundle: nil, for: self, at: index) as! ColumnCell
        nibCell.item = data?.list[index] as? GridItem
        return nibCell
    }
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    func didSelectItem(at index: Int) {
        deLog("didSelectItem")
    }
}
