//
//  BidCell.swift
//  magic
//
//  Created by SteveLin on 2017/5/9.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class BidCell: UICollectionViewCell {
    
    
    @IBOutlet weak var rightTwoIcon: UIImageView!
    @IBOutlet weak var rightOneIcon: UIImageView!
    @IBOutlet weak var speView: UIView!
    
    var rightButtonCall:((_ uri:String?)->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var termLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        rightButtonCall?(bid?.uri)
        deLog("rightButtonClicked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deLog("init(coder:) has not been implemented")
    }
    
    var bid:Bid? {
        didSet {
            guard let bid = bid else {
                deLog("bid is nil")
                return
            }
            if bid.todayHot {
                rightTwoIcon.image = UIImage(named: "IMG_2535_05an")
            }
            
            if bid.weaklyBest {
                rightTwoIcon.image = UIImage(named: "IMG_2535_03an")
            }
            
            rightTwoIcon.isHidden = !(bid.weaklyBest || bid.todayHot)
            rateLabel.attributedText = ("\(bid.totalRate)%" as NSString).attributedString(withSubString: "%", fontSize: 16)
            amountLabel.text = "份额: \(bid.amount)"
            termLabel.text = "期限: \(bid.period)" + "\(bid.periodUnit ?? "")"
        }
    }
}
