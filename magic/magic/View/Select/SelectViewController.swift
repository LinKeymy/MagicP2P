//
//  SelectViewController.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit
import ChameleonFramework

class SelectViewController: SectionContentController {

    lazy var messageItem: UIBarButtonItem =
        UIBarButtonItem(imageName: "information3_2", target: self, action: #selector(toMessages))
    
    lazy var addItem: UIBarButtonItem =
        UIBarButtonItem(imageName: "tabbar_compose_icon_add", target: self, action: #selector(toAddSelected))
    
    lazy var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateContent), for: .valueChanged)
        return refresh
    }()
    
    let viewModel = SelectedViewModel()
    
    func updateContent() {
        viewModel.updateContent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateContent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeContent()
        setupUI()
    }
    
    @objc private func toMessages() {
        Router.open("touzhijia://recommended/messages")
        print("toMessages")
    }
    
    @objc private func toAddSelected() {
        Router.open("touzhijia://platform/addSelect")
        print("toAddSelected")
    }
    
    private func setupUI() {
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refresh
        } else {
            //TODO
        }
        let items = [addItem,messageItem]
        navigationItem.rightBarButtonItems = items
        title = "自选"
    }
    
    private func observeContent() {
        viewModel.content.subscribe(onNext: { [weak self] in
            if $0.count > 0 {
                self?.refresh.endRefreshing()
                self?.data = $0
                self?.adapter.performUpdates(animated: false, completion: nil)
            }
        }).addDisposableTo(rx_disposeBag)
    }
    
}
