//
//  PlatTodayTurnoverCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatTodayTurnoverCell: UICollectionViewCell {
    
    @IBOutlet weak var bgIcon: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var boldLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var logoInfoLabel: UILabel!
    @IBOutlet weak var tipsIcon: UIImageView!
    
    
    var platform: PlatTodayTurnover? {
        didSet {
            if let plat = platform {
                topLabel.text = "\(plat.top)"
                bottomLabel.text = plat.platCnName
                logo.image = UIImage(named: plat.squareLogo ?? "")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
