//
//  PlatAssetsSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/7/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit


class PlatAssetsSectionController: BaseSectionController {
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 170)
    }
    
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "PlatAssetsCell", bundle: nil, for: self, at: index) as! PlatAssetsCell
        nibCell.assets = data?.list[index] as? SelectedAssets
        nibCell.rechargeCall = { [weak self] uri in
       let vc = UIStoryboard.init(name: "Balance", bundle: nil).instantiateViewController(withIdentifier: "BalanceRechargeViewController")
             self?.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
        nibCell.withdrawCall = { [weak self] uri in
            let vc = UIStoryboard.init(name: "Balance", bundle: nil).instantiateViewController(withIdentifier: "WithDrawViewController")
            self?.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
        return nibCell
    }
}
