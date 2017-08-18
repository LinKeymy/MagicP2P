//
//  PlatSelectGuideContorller.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatSelectGuideContorller: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "11"))
    }

    @IBAction func addRightNow(_ sender: UIButton) {
        show(alert: "TODO:开通并绑定平台")
    }

    @IBAction func noThanks(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
