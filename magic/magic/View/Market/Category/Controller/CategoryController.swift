//
//  CategoryController.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//



import UIKit
import IGListKit
import RxSwift

class CategoryController: SectionContentController {
    
    fileprivate lazy var bidVM : MarketViewModel = MarketViewModel()
    let bag = DisposeBag()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = bidVM.fecthContent().debug().subscribe(onNext: {
            [weak self] in
            if $0.count > 0 {
                self?.data = $0
            }
//            self?.adapter.reloadData(completion: nil)
            self?.adapter.performUpdates(animated: true, completion: nil)
            }, onError: {
                print("fecthContentx-onError:\($0)")
        })
    }
}


