//
//  RenewCell.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class RenewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var leftBottomLabel: UILabel!
    @IBOutlet weak var centerTopLabel: UILabel!
    @IBOutlet weak var centerBottomLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var rightTopLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
         leftTopLabel.text = "待收本息"
         centerTopLabel.text = "到期日"
    }
    
    var bid: RenewBid? {
        didSet {
            if let bid = bid {
                titleLabel.text = bid.borrowTitle
                leftBottomLabel.text = "\(bid.principalInterest)"
                centerBottomLabel.text = bid.dueDate
            }
     
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
