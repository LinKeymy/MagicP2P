//
//  EmbeddedMenuSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/9.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class EmbeddedMenuSectionController: IGListSectionController,IGListSectionType {
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let containrWidth = collectionContext?.containerSize.width ?? 0
        let width = containrWidth / 3
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: width, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
           let nibCell = collectionContext!.dequeueReusableCell(withNibName: "EmbeddedMemuCell", bundle: nil, for: self, at: index) as! EmbeddedMemuCell
        nibCell.backgroundColor = UIColor.white
        return nibCell
    }
    
    func didUpdate(to object: Any) {
        print("object:\(object)")
    }
    
    func didSelectItem(at index: Int) {}
}
