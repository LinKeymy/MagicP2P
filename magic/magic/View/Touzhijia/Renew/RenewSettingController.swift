//
//  RenewSettingController.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class RenewSettingController: UIViewController {
    
    

    @IBOutlet weak var topDescLabel: UILabel!
    @IBOutlet weak var vipIcon: UIImageView!
    @IBOutlet weak var brandBidBtn: UIButton!
    @IBOutlet weak var commonBidBtn: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var oneMonthBtn: UIButton!
    @IBOutlet weak var twoMonthBtn: UIButton!
    @IBOutlet weak var threeMonthBtn: UIButton!
    @IBOutlet weak var sixMonthBtn: UIButton!
    @IBOutlet weak var passwordTextfiled: UITextField!
    @IBOutlet weak var topDescLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var oneMonthBtnWidth: NSLayoutConstraint!
    @IBOutlet weak var bidTypeSpace: NSLayoutConstraint!
    @IBOutlet weak var vipIconLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "续购设置"
    }
    
    @IBAction func monthBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func bondTypeDidClicked(_ sender: UIButton) {
        
    }
    @IBAction func passwrodTextFiledValueChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func forgetBtnDidClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func confirmBtnDidClicked(_ sender: UIButton) {
        
    }
    


}
