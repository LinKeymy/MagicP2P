//
//  PlatBaseInfoCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatBaseInfoCell: UICollectionViewCell {
    
    

    @IBOutlet weak var infoView: PlatBaseInfoView!

    @IBOutlet weak var speView: UIView!
    
    var info: PlatBaseInfo? {
        didSet {
            infoView.nameLabel.text = info?.platCnName
            infoView.centerTLabel.text = info?.creditLevel
            infoView.centerBLabel.text = "\(info?.avgRate ?? 0)"
            infoView.tagLabel.text = info?.tags?.reduce("", { (result, one) -> String in
                return result + one
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
