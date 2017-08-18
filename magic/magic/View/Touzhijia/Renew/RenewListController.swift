//
//  RenewListController.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

fileprivate let RenewCellID = "RenewCellID"
class RenewListController: UITableViewController {
    
    let viewModel = RenewViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.updateRenewList()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "预约续购"
        tableView.tableFooterView = UIView()
        viewModel.updatedSources.subscribe(
            onNext: { [weak self] updated in
            self?.tableView.reloadData()
        }).addDisposableTo(rx_disposeBag)
        tableView.mRegister(xibName: "RenewCell", id: RenewCellID)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSources
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RenewCellID, for: indexPath) as! RenewCell
        cell.bid = viewModel.sources[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = Bundle.main.loadNibNamed("BoldTitleHeader", owner: nil, options: nil)?.first as? BoldTitleHeader
        if let v = view {
            v.leftLabel.textColor = Gray.regular
            v.leftLabel.font = UIFont.systemFont(ofSize: 15)
            v.leftLabel.text = "连续开启预约续购最高加息1%"
            v.backgroundColor = Background.table
            v.topSepView.isHidden = true
            v.rightButton.setTitle("一键设置", for: .normal)
        }
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router.open("touzhijia://assets/renew/settings")
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
