//
//  PlatAssetsCell.swift
//  magic
//
//  Created by SteveLin on 2017/7/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatAssetsCell: UICollectionViewCell {
    
    
    var rechargeCall:((String?)->())?
    var withdrawCall:((String?)->())?
    
    @IBOutlet weak var totalAssetsLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBAction func recharge(_ sender: UIButton) {
        rechargeCall?(assets?.uri)
        deLog("recharge")
    }

    @IBAction func withdraw(_ sender: UIButton) {
        withdrawCall?(assets?.uri)
        deLog("withdraw")
    }
    var assets: SelectedAssets? {
        didSet {
            if let assets = assets {
                totalAssetsLabel.text = "\(assets.totalAmount)"
                balanceLabel.text = "\(assets.balanceAmount)"
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
