//
//  BalanceRechargeViewController.swift
//  magic
//
//  Created by SteveLin on 2017/7/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class BalanceRechargeViewController: UITableViewController {

    @IBOutlet weak var rechargeAmountTextfiled: UITextField!
    @IBOutlet weak var nextstepButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        rechargeAmountTextfiled.becomeFirstResponder()
        title = "充值"
    }

    @IBAction func rechargeAmountDidChanged(_ sender: UITextField) {
        if let text = sender.text {
            if text.characters.count > 0 {
                nextstepButton.isEnabled = true
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 40 : 0.01
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 15 : 0.01
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return section == 0 ? "该卡本次最多可充值39848元" : nil
    }

}
