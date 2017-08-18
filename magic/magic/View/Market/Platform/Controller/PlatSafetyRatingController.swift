//
//  PlatSafetyRatingController.swift
//  magic
//
//  Created by SteveLin on 2017/6/21.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


fileprivate let cellId = "AddSelectPlatCellID"


class BasePlatGridController: BaseAnchorVC {
    
    let viewModel: PlatViewModel = PlatViewModel()
    
    var data:[SectionContent]?
    
    override func loadView() {
        self.view = tableView
    }
    
    lazy var tableView: UITableView = {
        let v = UITableView(frame: CGRect.zero, style: .plain)
        v.mRegister(xibName: "AddSelectPlatCell", id: cellId)
        v.rowHeight = 70
        v.dataSource = self
        v.delegate = self
        return v
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "安全评级"
        loadData()
        rightItem(type: .infoLight) { [weak self] in
            self?.show(alert: "提供安全评级相关的描述界面")
        }
    }
    
    func loadData() {
        viewModel.safetyRating().subscribe(
            onNext: { [weak self] in
                self?.data = $0
                self?.tableView.reloadData()
        }).addDisposableTo(rx_disposeBag)
    }
}




extension BasePlatGridController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?[section].list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AddSelectPlatCell
        cell.plat = data?[indexPath.section].list[indexPath.row] as? PlatBaseInfo
        return cell
    }
}

extension BasePlatGridController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let view = Bundle.main.loadNibNamed("BoldTitleHeader", owner: nil, options: nil)?.first as? BoldTitleHeader
        if let v = view {
            v.leftLabel.textColor = TinColor.button
            v.leftLabel.text = data?[section].title
            v.backgroundColor = Background.header
            v.topSepView.isHidden = true
            v.rightButton.setTitle(nil, for: .normal)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


class PlatSafetyRatingController: BasePlatGridController {
    
}



class PlatBackgroundController: BasePlatGridController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "平台背景"
        rightItem(type: .infoLight) {  [weak self] in
            self?.show(alert: "提供平台背景相关的描述界面")
        }
    }
    
    override func loadData() {
        viewModel.background().subscribe(
            onNext: { [weak self] in
                self?.data = $0
        }).addDisposableTo(rx_disposeBag)
    }
    
}


class PlatHaveDepositoryController: BasePlatGridController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "有存管"
        rightItem(type: .infoLight) {  [weak self] in
            self?.show(alert: "提供平台存管相关的描述界面")
        }
    }
    
    override func loadData() {
        viewModel.depository().subscribe(
            onNext: { [weak self] in
                self?.data = $0
        }).addDisposableTo(rx_disposeBag)
    }
    
}
