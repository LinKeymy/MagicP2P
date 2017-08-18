//
//  SelectedToolBar.swift
//  magic
//
//  Created by SteveLin on 2017/6/23.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class SelectedToolBar: UIVisualEffectView {
    
    var showAction:( () -> () )?
    
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    @IBAction func showTotalAssetsDetail(_ sender: UITapGestureRecognizer) {
        (showAction != nil) ? showAction!() : ()
        deLog("SelectedToolBar 被点击")
    }

}
