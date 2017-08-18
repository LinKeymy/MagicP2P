//
//  JustTextCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class JustTextCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    var item: GridItem? {
        didSet {
            titleLabel.text = item?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
