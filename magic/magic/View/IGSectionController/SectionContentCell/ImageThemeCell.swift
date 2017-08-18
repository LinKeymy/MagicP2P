//
//  ImageThemeCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class ImageThemeCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var centerLabel: UILabel!
    
    var item: GridItem? {
        didSet {
            centerLabel.text = item?.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
