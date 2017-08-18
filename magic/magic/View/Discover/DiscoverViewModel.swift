//
//  DiscoverViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/6/29.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import RxSwift
import Moya


class DiscoverViewModel: TableSourceType {
    
    var sourcesble = Variable<[SectionContent]>([])
    var numberOfSections: Int {
        return sources.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        if sources[section].conType == .staticBanner {
            return 1
        } else {
            return sources[section].list.count
        }
    }
    
    func updateDiscover() {
        _ = self.fetchDiscoverContent().subscribe(
            onNext: { [weak self] in
                self?.sourcesble.value = $0
        })
    }
    
    func fetchDiscoverContent() -> Observable<[SectionContent]> {
        return Network.request(DiscoverAPI.home).mapModels(type: SectionContent.self)
    }
    
    
}
