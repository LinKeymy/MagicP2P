//
//  SelectedViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/8/7.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class SelectedViewModel:NSObject {
   
    var content: Observable<[SectionContent]> {
        return contents.asObservable()
    }

    private var contents = Variable<[SectionContent]>([])
    
    func updateContent() {
        fecthContent().subscribe(onNext: { [weak self] in
            self?.contents.value = $0
        }).addDisposableTo(rx_disposeBag)
    }

    func fecthContent() -> Observable<[SectionContent]> {
        return Network.request(AssetsAPI.selectedPage).mapModels(type:SectionContent.self)
    }

}
