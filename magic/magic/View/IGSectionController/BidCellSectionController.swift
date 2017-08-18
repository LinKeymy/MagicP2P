//
//  BidCellSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/9.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class BidCellSectionController: BaseSectionController {
    

    override func sizeForItem(at index: Int) -> CGSize {
        let containrWidth = collectionContext?.containerSize.width ?? 0
        let height = CGFloat(100)
        return CGSize(width: containrWidth, height: height)
    }
    
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "BidCell", bundle: nil, for: self, at: index) as! BidCell
            nibCell.bid = data?.list[index] as? Bid
        nibCell.rightButtonCall = { uri in
            if uri != nil {
                Router.open(uri!)
            } else {
                Router.open("touzhijia://bid/purchase")
//                let vc = UIViewController()
//                vc.title = "购买界面"
//                vc.view.backgroundColor = UIColor.white
//                self?.viewController?.navigationController?.pushViewController(vc, animated: true)
            }
        }
//        if let count = data?.list.count {
//            nibCell.speView.isHidden = (count - 1 == index)
//        }
        return nibCell
    }
    

    override func didSelectItem(at index: Int) {
        let vc = UIViewController()
        vc.title = "标的详情"
        vc.view.backgroundColor = UIColor.white
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

}

