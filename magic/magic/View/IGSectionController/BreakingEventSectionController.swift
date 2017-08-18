//
//  BreakingEventSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit


class BreakingEventSectionController: BaseSectionController {
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 313)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibcell = collectionContext?.dequeueReusableCell(withNibName: "BreakingEventCell", bundle: nil, for: self, at: index) as! BreakingEventCell
        
        return nibcell
    }

}
