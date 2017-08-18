//
//  BaseAnchorVC.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit


extension UIViewController {
    func show(alert: String?) {
         let alertVc = UIAlertController(title: "！！！", message: alert, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "确定", style: .destructive) { (action) in
            print(action)
        }
        alertVc.addAction(action1)
         self.present(alertVc, animated: true, completion: nil)
    }
}

extension UITableView {
    func mRegister( xibName name: String, id reuseIdentifier:String) {
      register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}

class BaseAnchorVC: BaseViewController {
    
    fileprivate var rightItemAction: (()->())?
    
    lazy var loadingSpinner: Spinner = {
        let v = Spinner(frame: CGRect(x: kScreenW / 2.0, y: kScreenH / 2.0, width: 30, height: 30))
        self.view.addSubview(v)
        v.snp.makeConstraints({ (make) in
            make.width.height.equalTo(30)
            make.center.equalTo(self.view)
        })
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView:IGListCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
}

extension BaseAnchorVC {
    
    func rightItem(type: UIButtonType, action:@escaping (()->())) {
        let btn = UIButton(type: type)
        btn.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        rightItemAction = action
    }
    
    func rightAction() {
        rightItemAction?()
        deLog("rightAction")
    }
}

