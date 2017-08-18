//
//  RecommendController.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit
import RxSwift


class RecommendController: SectionContentController {
    fileprivate lazy var recommendVM : RecommendVM = RecommendVM()
    let bag = DisposeBag()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ =  recommendVM.fecthContent().subscribe(
            onNext: { [weak self] in
                self?.data = $0
                self?.adapter.performUpdates(animated: true, completion: nil)
        },
            onDisposed: {
            print("Finish adding a new todo.")
        })
    }
}

