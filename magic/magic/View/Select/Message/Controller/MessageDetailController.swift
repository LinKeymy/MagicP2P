//
//  MessageDetailController.swift
//  magic
//
//  Created by SteveLin on 2017/6/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import ChameleonFramework

fileprivate let MessageDetailCellID = "MessageDetailCellID"

class MessageDetailController: BaseAnchorVC {
    lazy var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(fetchMessage), for: .valueChanged)
        return refresh
    }()
    var messageSource:MessageSource
    let detaiVM:MessageListViewModel
    init(source:MessageSource) {
        messageSource = source
        self.detaiVM = MessageListViewModel(id: source.id ?? "0")
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
       view = tableView
    }
    
    lazy var tableView:UITableView = {
        let view =  UITableView(frame: .zero, style: .grouped)
        return view
    }()
    
    func fetchMessage () {
        detaiVM.fetchMessage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = messageSource.name
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 30))
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refresh
        } else {
            // Fallback on earlier versions
        }
        tableView.backgroundColor = THexColor("EFEFF4")
        tableView.separatorStyle = .none
        tableView.mRegister(xibName: "MessageDetailCell", id: MessageDetailCellID)
        tableView.estimatedRowHeight = 300
        
        _ = detaiVM.updatedSources.subscribe(
            onNext: { [weak self] updated in
                self?.tableView.reloadData()
                self?.refresh.endRefreshing()
        })
        if let messages = messageSource.messages {
            detaiVM.sourcesble.value = messages.map { return MessageViewModel(message:$0) }
        }
        scrollerToBttom()
    }
}

extension MessageDetailController {
    
    func scrollerToBttom() {
        delay(0.1) { [weak self] in
            if let sections = self?.detaiVM.sections,
                let lastSection = sections.last {
                if lastSection.count > 0 {
                    let path = IndexPath(row: lastSection.count - 1  , section: sections.count - 1)
                    self?.tableView.scrollToRow(at: path, at: .top, animated: false)
                }
            }
            self?.tableView.isHidden = false
        }
    }

}


extension MessageDetailController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return detaiVM.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detaiVM.sections[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageDetailCellID, for: indexPath) as! MessageDetailCell
        if detaiVM.sections.count > indexPath.section || detaiVM.sections[indexPath.section].count > indexPath.row {
            cell.viewModel = detaiVM.sections[indexPath.section][indexPath.row]
        }
        
        return  cell
    }
}

extension MessageDetailController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if detaiVM.sections.count > indexPath.section || detaiVM.sections[indexPath.section].count > indexPath.row {
//           return detaiVM.sections[indexPath.section][indexPath.row].cellHeight
//        } else {
//            return 44
//        }
//    }
////
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v =  Bundle.main.loadNibNamed("MessageDateView", owner: nil, options: nil)?.first as? MessageDateView
        v?.dateString = detaiVM.sections[section].first?.dayString
        v?.contentView.backgroundColor = THexColor("EFEFF4")
        return v
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
