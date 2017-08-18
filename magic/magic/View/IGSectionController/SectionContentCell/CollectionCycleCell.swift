//
//  CollectionCycleCell.swift
//  1106-douyu
//
//  Created by targetcloud on 2016/11/9.
//  Copyright © 2016年 targetcloud. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
//    // MARK: 定义模型属性
    var cycleModel : ImageLinkModel? {
        didSet {
            if let iconURL = URL(string: cycleModel?.image_url ?? "") {
                iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "ico_com_normal"))
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.contentMode = .scaleAspectFill
        // Initialization code
    }

}
