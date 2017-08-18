//
//  WithDrawViewController.swift
//  magic
//
//  Created by SteveLin on 2017/7/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class WithDrawViewController: UITableViewController {

    @IBOutlet weak var withdrawAmountTextfiled: UITextField!
    
    @IBAction func withdrawAmountDidChanged(_ sender: UITextField) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "提现"
        withdrawAmountTextfiled.becomeFirstResponder()
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 15 : 20
    }

}
