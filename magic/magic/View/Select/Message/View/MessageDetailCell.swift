//
//  MessageDetailCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Kingfisher
class MessageDetailCell: UITableViewCell {
    
    @IBOutlet weak var dayViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var contenLabel: UILabel!
    @IBOutlet weak var checkLabel: UILabel!
    
    @IBOutlet weak var pictrueView: UIView!
    @IBOutlet weak var iconTopMargin: NSLayoutConstraint!
    @IBOutlet weak var pictrueViewHeight: NSLayoutConstraint!
    var viewModel:MessageViewModel? {
        didSet{
            if let viewModel = viewModel {
                timeLabel.text = viewModel.time
                titleLabel.text = viewModel.title
                contenLabel.text = viewModel.contentDesc
                iconView.kf.setImage(with: viewModel.iconURL)
                pictrueViewHeight.constant = viewModel.pictureViewSize.height
//                layoutIfNeeded() 
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
