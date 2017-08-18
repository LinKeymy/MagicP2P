//
//  StaticBannerCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/29.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Kingfisher

class StaticBannerCell: UICollectionViewCell {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titlleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    
    var item:GridItem? {
        didSet {
            descLabel.text = item?.detailText
            titlleLabel.text = item?.title
            if let str = item?.icon,
                let url = URL(string: str) {
                iconView.kf.setImage(with: url)
            }
        }
    } 

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.cornerRadius = 3
    }
}
