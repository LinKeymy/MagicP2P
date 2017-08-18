//
//  PlatTabViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/6/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class PlatTabViewModel:TableSourceType {
    
    convenience init(platName:String) {
        self.init()
        self.platName = platName
    }
    
    var platName:String = ""
    
    var sourcesble = Variable<[SectionContent]>([])
    
    var numberOfSections: Int {
        return sources.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return sources[section].list.count
    }
    
    func fecthAccount() {
       _ = self.fecthAccount(name: self.platName).subscribe(
            onNext: { [weak self] in
               self?.sourcesble.value = $0
        })
    }
    
}


extension PlatTabViewModel {
    func fecthProduct(name:String) -> Observable<[SectionContent]> {
        return Network.request(SelectedAPI.platform(name: name, tab: .product)).mapModels(type:SectionContent.self)
    }
    
    func fecthDetect(name:String) -> Observable<[SectionContent]>  {
        return Network.request(SelectedAPI.platform(name: name, tab: .detect)).mapModels(type:SectionContent.self)
    }
    
    func fecthAccount(name:String) -> Observable<[SectionContent]>  {
        return Network.request(SelectedAPI.platform(name: name, tab: .account)).mapModels(type:SectionContent.self)
    }
}
