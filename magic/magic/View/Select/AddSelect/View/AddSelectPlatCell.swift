//
//  AddSelectPlatCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class AddSelectPlatCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    var plat: PlatBaseInfo? {
        didSet {
            if let plat = plat {
                nameLabel.text = plat.platCnName
                creditLabel.text = plat.creditLevel
                rateLabel.text = "\(plat.avgRate)%"
                tagLabel.text = plat.tags?.reduce("", { (re, one) -> String in
                    re + one
                })
            }
        }
        
    }
    

    @IBAction func addButtonDidTouchUpInside(_ sender: UIButton) {
        print("addButtonDidTouchUpInside")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
