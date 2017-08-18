//
//  ImageThemeSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class ImageThemeSectionController: IGListSectionController, IGListSectionType{
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        self.minimumLineSpacing = 10
    }

    var data: SectionContent?
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    func didSelectItem(at index: Int) {
        deLog("didSelectItem")
    }
    
    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 145, height: 75)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "ImageThemeCell", bundle: nil, for: self, at: index) as! ImageThemeCell
        nibCell.item = data?.list[index] as? GridItem
        return nibCell
    }
    
}
