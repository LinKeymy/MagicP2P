//
//  JustTextSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class JustTextSectionController: BaseSectionController {

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext?.dequeueReusableCell(withNibName: "JustTextCell", bundle: nil, for: self, at: index) as! JustTextCell
        nibCell.item = data?.list[index] as? GridItem
        return nibCell
    }
    
}
