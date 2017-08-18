//
//  MessageController.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import RxSwift

let MessageCellID = "MessageCellID"

class MessageController: BaseAnchorVC {
    lazy  var  messageVM:SourcesViewModel = SourcesViewModel()
    @IBOutlet weak var tableView: UITableView!
    fileprivate func setupTable() {
        tableView.tableFooterView = UIView()
        tableView.mRegister(xibName: "MessageCell", id: MessageCellID)
    }
    fileprivate func viewModelSubscribe() {
        messageVM.updatedSources.subscribe(onNext: { [weak self] updated in
            self?.tableView.reloadData() }).addDisposableTo(rx_disposeBag)

        messageVM.showSpinner.not().bind(to:loadingSpinner.rx_hidden).addDisposableTo(rx_disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "消息通知"
        navigationItem.titleView = nil
        setupTable()
        viewModelSubscribe()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messageVM.updateMessageSources()
    }
}

//UITableViewDelegate
extension MessageController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if messageVM.sources.count > indexPath.row {
            let source = messageVM.sources[indexPath.row]
            let detailVc = MessageDetailController(source:source)
            self.navigationController?.pushViewController(detailVc, animated: true)
            source.unread = 0
        }
    }
}

//UITableViewDataSource
extension MessageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageVM.numberOfSources
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCellID, for: indexPath)  as! MessageCell
        if messageVM.numberOfSources > indexPath.row {
            cell.source = messageVM.sources[indexPath.row]
        }
        return cell
    }
}

