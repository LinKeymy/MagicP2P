//
//  PlatBaseInfoView.swift
//  magic
//
//  Created by SteveLin on 2017/6/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatBaseInfoView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deLog("aDecoder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var rightButtonCall:((String?)->())?
    
    @IBOutlet weak var centerTLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var centerBLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func rightButtonDidClicked(_ sender: UIButton) {
        rightButtonCall?("")
    }

}
