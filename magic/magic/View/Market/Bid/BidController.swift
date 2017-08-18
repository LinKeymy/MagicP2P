//
//  BidController.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//


import UIKit
import IGListKit
import RxSwift

class BidController: SectionContentController {
    
    fileprivate lazy var bidVM : BidViewModel = BidViewModel()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = bidVM.fecthContent().debug().subscribe(onNext: {
            [weak self] in
            if $0.count > 0 {
               self?.data = $0
            }
            self?.adapter.reloadData(completion: nil)
            }, onError: {
           print("fecthContentx-onError:\($0)")
        })
    }
}
