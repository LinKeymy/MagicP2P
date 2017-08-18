//
//  DiscoverViewController.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import RxSwift

class DiscoverViewController: BaseViewController {
    
    fileprivate lazy var recommendVM : RecommendVM = RecommendVM()

    
    let viewModel = DiscoverViewModel()
    
    lazy var tableView:UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .plain)
        return table
    }()
    
    lazy var staticBanner: StaticBannerView = StaticBannerView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenW * 0.7))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.updatedSources.subscribe(
            onNext: {  [weak self] updated in
                self?.tableView.reloadData()
        }).addDisposableTo(rx_disposeBag)
        
        staticBanner.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.updateDiscover()
    }

}

extension DiscoverViewController: StaticBannerViewDelegate {
    func didSelected(staticBannerView: StaticBannerView, index: Int) {
        if let item = viewModel.sources[0].list[index] as? GridItem,
            let uri = item.uri {
            Router.open(uri)
        }
    }
}

extension DiscoverViewController {

    func setupUI() {
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        automaticallyAdjustsScrollViewInsets = false
        let insetTop = navigationBar.bounds.height
        let insetBottom = CGFloat(49)
        tableView.contentInset = UIEdgeInsets(top:insetTop , left: 0, bottom:insetBottom , right: 0);
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
}

extension DiscoverViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if indexPath.section == 0 {
            staticBanner.items = viewModel.sources[indexPath.section].list as? [GridItem]
            cell.addSubview(staticBanner)
        } else {
            cell.accessoryType = .disclosureIndicator
           if let item = viewModel.sources[indexPath.section].list[indexPath.row] as? GridItem {
             cell.textLabel?.text = item.title
            }
        }
        return cell
    }
}



extension DiscoverViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? staticBanner.frame.height : 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let item = viewModel.sources[indexPath.section].list[indexPath.row] as? GridItem,
                let uri = item.uri {
                Router.open(uri)
            }
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
