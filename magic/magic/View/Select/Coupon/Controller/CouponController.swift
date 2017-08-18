//
//  ConponController.swift
//  magic
//
//  Created by SteveLin on 2017/6/14.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

fileprivate let CouponCellID = "CouponCellID"

class CouponController: BaseAnchorVC {
    
    lazy var tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    override func loadView() {
        view = tableView
    }
    let viewModel:CouponViewModel =  CouponViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = Background.page
        tableView.separatorStyle = .none
        title = "理财券"
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.mRegister(xibName: "CouponCell", id: "CouponCellID")
        viewModel.updatedSources.subscribe(
            onNext: {  [weak self] updated in  self?.tableView.reloadData() }).addDisposableTo(rx_disposeBag)
        viewModel.showSpinner.not().bind(to: loadingSpinner.rx_hidden).addDisposableTo(rx_disposeBag)
        viewModel.updateCopons()
    }
}


extension CouponController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSources
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CouponCellID, for: indexPath) as! CouponCell
        cell.coupon = viewModel.sources[indexPath.row]
        return cell
    }
}
