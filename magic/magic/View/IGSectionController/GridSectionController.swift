//
//  GridSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/31.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit
import ChameleonFramework


final class GridSectionController: IGListSectionController, IGListSectionType {
    
    var object: SectionContent?
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }
    
    func numberOfItems() -> Int {
        var count = object?.list.count ?? 0
        let m = count % 3
        count = (m == 0) ? count : count + (3 - m)
        return count
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = floor(width / 3 )
        return CGSize(width: itemSize, height: itemSize - 20)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as! CenterLabelCell
        
            if let items = object?.list as? [GridItem] {
                if items.count > index {
                    let user = items[index]
                    cell.title = user.title
                    cell.detailText = user.detailText
                    if let name = user.icon {
                        cell.icon = UIImage(named: name)
                    }
                    cell.embedded.label.isHidden = false
                    cell.embedded.topBtn.isHidden = false
                } else {
                    cell.embedded.label.isHidden = true
                    cell.embedded.topBtn.isHidden = true
                }
            }
        cell.embedded.isHideLine = false
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? SectionContent
    }
    
    func didSelectItem(at index: Int) {
        if let item =  object?.list[index] as? GridItem,
            let uri = item.uri {
            Router.open(uri)
        }
        print("index:\(index)")
    }
}


// 顶部标题
extension GridSectionController:IGListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                       for: self,
                                                                       nibName: "BoldTitleHeader",
                                                                       bundle: nil,
                                                                       at: index) as! BoldTitleHeader
        view.leftLabel.text = object?.title
        view.rightButton.isHidden = true
//        view.backgroundColor = THexColor("EBEBF1")
        view.backgroundColor = UIColor.white
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        var h: CGFloat =  0.01
        if let show = object?.isShowHeader {
            if  show {
                h = 40
            }
        }
        return CGSize(width: collectionContext!.containerSize.width, height: h)
    }
}
