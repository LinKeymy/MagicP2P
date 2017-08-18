//
//  FocalcontentCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class FocalcontentCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    var item: GridItem? {
        didSet {
            titleLabel.text = item?.title
            descLabel.text = item?.detailText
        
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
