//
//  PlatController.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit


class PlatController: SectionContentController {
    
    lazy var platVM: PlatViewModel = PlatViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      _ = platVM.fecthContent().debug().subscribe(
            onNext: { [weak self] in
                if $0.count > 0 {
                    self?.data = $0
                    self?.adapter.performUpdates(animated: false, completion: nil)
                }
        })
    }
}

