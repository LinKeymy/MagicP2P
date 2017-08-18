//
//  PlatBaseInfoListHeader.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatBaseInfoListHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Background.table
    }

    @IBAction func buttonDidTouchUpInside(_ sender: UIButton) {
        print("senderTag:\(sender.tag)")
    }

}
