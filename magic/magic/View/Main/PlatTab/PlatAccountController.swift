//
//  PlatAccountController.swift
//  magic
//
//  Created by SteveLin on 2017/5/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


class PlatAccountController: BaseViewController {
    
    
    let viewModel: PlatTabViewModel = PlatTabViewModel()
    
    lazy var tableView:UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        return table
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fecthAccount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.updatedSources.subscribe(
            onNext: {  [weak self] update in
            self?.tableView.reloadData()
        }).addDisposableTo(rx_disposeBag)
    }
}

extension PlatAccountController {
    
    func setupUI() {
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        automaticallyAdjustsScrollViewInsets = false
        let insetBottom = CGFloat(49)
        tableView.contentInset = UIEdgeInsets(top:0 , left: 0, bottom:insetBottom , right: 0);
        tableView.scrollIndicatorInsets = tableView.contentInset
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
}


//UITableViewDataSource
extension PlatAccountController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type: UITableViewCellStyle = indexPath.section > 0 ? .value1 : .subtitle
        let cell = UITableViewCell(style: type, reuseIdentifier: nil)
        
        let item = viewModel.sources[indexPath.section].list[indexPath.row] as? GridItem
        cell.textLabel?.text = item?.title
        if item?.detailText != nil {
            cell.detailTextLabel?.text = item?.detailText
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
}

extension PlatAccountController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 90 : 44
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = viewModel.sources[indexPath.section].list[indexPath.row] as? GridItem,
            let uri = item.uri {
            Router.open(uri)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}


