//
//  CouponCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/14.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import ChameleonFramework

class CouponCell: UITableViewCell {
    
    @IBOutlet weak var couponDescView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var couponDescLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountDescLabel: UILabel!
    @IBOutlet weak var requirementLabel: UILabel!
    @IBOutlet weak var timeLimitLabel: UILabel!
//    _statusIcon.hidden = ![vouObj.status isEqualToString:@"exchange"];
    var coupon:Coupon? {
        didSet {
            guard let coupon = coupon else {
                print("理财券coupon为空值")
                return
            }
            couponDescLabel.text = coupon.title
            amountLabel.text =  coupon.denomination
            amountDescLabel.text = coupon.desc
            requirementLabel.text = coupon.limitStr
            timeLimitLabel.text = coupon.expiredTimeStr
            if let bgColor = coupon.backgroundColor {
                leftView.backgroundColor = THexColor(bgColor)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
