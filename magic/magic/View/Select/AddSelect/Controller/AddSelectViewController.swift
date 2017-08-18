//
//  AddSelectViewController.swift
//  magic
//
//  Created by SteveLin on 2017/6/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

 let AddSelectPlatCellID = "AddSelectPlatCellID"

class AddSelectViewController: BaseAnchorVC {
    
    private lazy var tableView:UITableView = UITableView(frame: .zero, style: .plain)
    
    override func loadView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.tableFooterView = UIView()
        tableView.mRegister(xibName: "AddSelectPlatCell", id: AddSelectPlatCellID)
        view = tableView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = nil
        title = "添加更多自选"
    }
}

extension AddSelectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return tableView.dequeueReusableCell(withIdentifier: AddSelectPlatCellID, for: indexPath)
    }
}

extension AddSelectViewController: UITableViewDelegate {
    
}
