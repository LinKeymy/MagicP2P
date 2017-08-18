//
//  BoldTitleHeader.swift
//  magic
//
//  Created by SteveLin on 2017/5/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class BoldTitleHeader: UICollectionReusableView {
    
    @IBOutlet weak var topSepView: UIView!
    @IBOutlet weak var leftLabel:UILabel!
    @IBOutlet weak var rightButton:UIButton!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBAction func rightButtonTouchUp(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rightButton.isHidden = false
    }
    
}
