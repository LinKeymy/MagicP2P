//
//  PasswordsController.swift
//  magic
//
//  Created by SteveLin on 2017/7/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PasswordsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "密码设置"

    }
}

extension PasswordsController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

