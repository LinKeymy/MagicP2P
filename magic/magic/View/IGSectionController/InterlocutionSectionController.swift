//
//  InterlocutionSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/9.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit
class InterlocutionSectionController: IGListSectionController,IGListSectionType {
    
    var locutions:[LocutionModel]?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
    }
    
    func numberOfItems() -> Int {
        return locutions?.count ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let containrWidth = collectionContext?.containerSize.width ?? 0
        let height = CGFloat(120)
        return CGSize(width: containrWidth, height: height)
    }
    
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "LocutionCollectionViewcCell", bundle: nil, for: self, at: index) as! LocutionCollectionViewcCell
        //        nibCell.backgroundColor = UIColor.randomColor()
        return nibCell
    }
    
    
    func didUpdate(to object: Any) {
        locutions = object as? [LocutionModel]
    }
    
    
    func didSelectItem(at index: Int) {
        print(index)
    }
}
