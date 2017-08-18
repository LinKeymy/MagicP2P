//
//  SelectedPlatCell.swift
//  magic
//
//  Created by SteveLin on 2017/5/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class SelectedPlatCell: UICollectionViewCell {
    
    var assets:SelectedAssets? {
        didSet {
            platNameLabel.text = assets?.platCnName
            rightTagLabel.text = "上市系"
            balanceLabel.text = "\(assets?.balanceAmount ?? 0)"
            assetsLabel.text  = "\(assets?.totalAmount ?? 0)"
            if let name = assets?.platCnName {
                if name == "总资产" {
                    platNameLabel.textColor = TinColor.button
                } else {
                    platNameLabel.textColor = Gray.regular
                }
            }
        }
    }

    @IBOutlet weak var rightTagLabel: UILabel!
    @IBOutlet weak var platNameLabel: UILabel!
    @IBOutlet weak var plattagLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var assetsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
