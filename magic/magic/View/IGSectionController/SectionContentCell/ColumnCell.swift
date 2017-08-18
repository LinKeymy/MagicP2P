//
//  ColumnCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/20.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Kingfisher

class ColumnCell: UICollectionViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    var item: GridItem? {
        didSet {
            descLabel.text = item?.detailText
            titleLabel.text = item?.title
            descLabel.text = item?.detailText
            icon.image = UIImage(named: item?.icon ?? "")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
