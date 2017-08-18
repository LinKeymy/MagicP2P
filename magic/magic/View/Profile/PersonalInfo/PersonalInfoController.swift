//
//  PersonalInfoController.swift
//  magic
//
//  Created by SteveLin on 2017/7/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PersonalInfoController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "个人中心"
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }

}
