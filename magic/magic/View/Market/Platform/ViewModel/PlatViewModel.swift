//
//  PlatViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/6/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import RxSwift
import Moya


class PlatViewModel {
    
    func fecthContent() -> Observable<[SectionContent]> {
        return Network.request(PlatAPI.home).mapModels(type:SectionContent.self)
    }
    
    func safetyRating() -> Observable<[SectionContent]> {
        return Network.request(PlatAPI.safetyRating).mapModels(type:SectionContent.self)
    }
    
    func background() -> Observable<[SectionContent]> {
        return Network.request(PlatAPI.background).mapModels(type:SectionContent.self)
    }
    
    func depository() -> Observable<[SectionContent]> {
        return Network.request(PlatAPI.depository).mapModels(type: SectionContent.self)
    }
    
}
