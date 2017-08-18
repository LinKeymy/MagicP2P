//
//  AssetsToolBar.swift
//  magic
//
//  Created by SteveLin on 2017/6/25.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class AssetsToolBar: UIVisualEffectView {
    
    var showAction:( () -> () )?

    @IBAction func didTapped(_ sender: UITapGestureRecognizer) {
        (showAction != nil) ? showAction!() : ()
        deLog("SelectedToolBar 被点击")
        
    }
    @IBOutlet weak var assetsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
}
