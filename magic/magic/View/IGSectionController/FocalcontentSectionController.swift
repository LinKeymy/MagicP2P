//
//  FocalcontentSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class FocalcontentSectionController: BaseSectionController {
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 105)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibcell = collectionContext?.dequeueReusableCell(withNibName: "FocalcontentCell", bundle: nil, for: self, at: index) as! FocalcontentCell
        nibcell.item = data?.list[index] as? GridItem
        return nibcell
    }
}
