//
//  PlatformBaseSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/6/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit




class PlatformBaseSectionController: IGListSectionController, IGListSectionType {
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }
    
    var data: SectionContent?

    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 90)
    }
    
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "PlatBaseInfoCell", bundle: nil, for: self, at: index) as! PlatBaseInfoCell
        nibCell.info = data?.list[index] as? PlatBaseInfo
        nibCell.infoView.rightButtonCall = { [weak self] uri in
            if let vc = UIStoryboard(name: "PlatSelectGuide", bundle: nil).instantiateInitialViewController() {
              self?.viewController?.present(vc, animated: true, completion: nil)
            }
          
        }
        return nibCell
    }
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    
    func didSelectItem(at index: Int) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        vc.title = "平台详情"
        viewController?.navigationController?.pushViewController(vc, animated: true)
        deLog("didSelectItem")
    }
    
}


extension PlatformBaseSectionController: IGListSupplementaryViewSource {
    
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

