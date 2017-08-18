//
//  SettingsController.swift
//  magic
//
//  Created by SteveLin on 2017/7/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {

    @IBOutlet weak var phoneDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneDetailLabel.text = "13168705790"
        title = "设置"
    }

}


extension SettingsController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            showSignOutAlert()
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    func showSignOutAlert() {
        let alertVc = UIAlertController(title: "确定要退出?", message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let signout = UIAlertAction(title: "退出登录", style: .destructive) { [weak self] (action) in
            self?.show(alert: "没有退出登录")
        }
        alertVc.addAction(cancel)
        alertVc.addAction(signout)
        present(alertVc, animated: true, completion: nil)
    }

}




