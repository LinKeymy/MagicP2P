//
//  BidCell01SectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/11.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class BidCell01SectionController: IGListSectionController,IGListSectionType {
    
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }
    
    func numberOfItems() -> Int {
        return 3
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let containrWidth = collectionContext?.containerSize.width ?? 0
        let height = CGFloat(100)
        return CGSize(width: containrWidth, height: height)
    }
    
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "BidCell01", bundle: nil, for: self, at: index) as! BidCell01
        return nibCell
    }
    
    
    func didUpdate(to object: Any) {
        
    }
    
    
    func didSelectItem(at index: Int) {
        print(index)
    }
    
}

extension BidCell01SectionController:IGListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                       for: self,
                                                                       nibName: "BoldTitleHeader",
                                                                       bundle: nil,
                                                                       at: index) as! BoldTitleHeader
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 40)
    }
}
