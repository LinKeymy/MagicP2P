//
//  CircleSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

private let kCycleViewH : CGFloat = kScreenW * 3 / 8

final class CircleSectionController: IGListSectionController,IGListSectionType {
    
    var data:SectionContent?
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width - 0.1, height: collectionContext!.containerSize.width * (3.5 / 8))
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "CollectionCycleViewCell", bundle: nil, for: self, at: index) as! CollectionCycleViewCell
        nibCell.cycleView.cycleModels = data?.list as? [ImageLinkModel]
        return nibCell
    }
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    func didSelectItem(at index: Int) {}
}

