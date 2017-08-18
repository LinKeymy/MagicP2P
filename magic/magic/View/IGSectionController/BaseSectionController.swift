//
//  BaseSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import IGListKit


class BaseSectionController: IGListSectionController {
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }
    
    var data: SectionContent?

}



extension BaseSectionController: IGListSectionType {
    
    
    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 90)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "PlatBaseInfoCell", bundle: nil, for: self, at: index) as! PlatBaseInfoCell
        nibCell.info = data?.list[index] as? PlatBaseInfo
        return nibCell
    }
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    
    func didSelectItem(at index: Int) {
        deLog("didSelectItem")
    }
}


extension BaseSectionController: IGListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                       for: self,
                                                                       nibName: "BoldTitleHeader",
                                                                       bundle: nil,
                                                                       at: index) as! BoldTitleHeader
        view.leftLabel.text = data?.title
        view.rightButton.setTitle(data?.rightEntry, for: .normal)
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        var h: CGFloat = 0.01
        if let data = data {
            if data.isShowHeader {
                h = 40
            }
        }
        return CGSize(width: collectionContext!.containerSize.width, height: h)
    }
    
}
