//
//  StaticBannerSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/7/7.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class StaticBannerSectionController: IGListSectionController, IGListSectionType {
    
    override init() {
        super.init()
        minimumLineSpacing = 10
        inset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    var data: SectionContent?
    
    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
       return CGSize(width: (collectionContext?.containerSize.width ?? kScreenW) - 40, height: (collectionContext?.containerSize.height ?? 100) - 20)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "StaticBannerCell", bundle: nil, for: self, at: index) as! StaticBannerCell
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
