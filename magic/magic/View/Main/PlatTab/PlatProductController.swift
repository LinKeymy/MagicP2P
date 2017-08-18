//
//  PlatProductController.swift
//  magic
//
//  Created by SteveLin on 2017/5/3.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class PlatProductController: SectionContentController {
    
    let viewModel: PlatTabViewModel = PlatTabViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0)
        viewModel.fecthProduct(name: "touzhijia").subscribe(
            onNext: { [weak self] in
                self?.data = $0
                self?.adapter.performUpdates(animated: true, completion: nil)
        }).addDisposableTo(rx_disposeBag)
    }
}
