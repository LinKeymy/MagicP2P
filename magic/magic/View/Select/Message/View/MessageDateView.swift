//
//  MessageDateView.swift
//  magic
//
//  Created by SteveLin on 2017/6/13.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class MessageDateView: UITableViewHeaderFooterView {

    var dateString:String? {
        didSet {
            dateButton.setTitle(dateString, for: .normal)
        }
    }
    @IBOutlet weak var dateButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
