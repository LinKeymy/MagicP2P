//
//  BalanceViewController.swift
//  magic
//
//  Created by SteveLin on 2017/7/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class BalanceViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 29, left: 0, bottom: 0, right: 0)
        automaticallyAdjustsScrollViewInsets = false
    }
}

extension BalanceViewController {
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return !(indexPath.section == 0 && indexPath.row == 0)
    }
}
