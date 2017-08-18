//
//  MarketViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation

import Moya
import RxSwift

class MarketViewModel {
    let imageLinks = Variable<[ImageLinkModel]>([])
    func getBanner() -> Observable<[ImageLinkModel]> {
        return TRecommendProvider.request(.banner).mapModels(type: ImageLinkModel.self)
    }
    
    func fecthContent() -> Observable<[SectionContent]> {
        return Network.request(MarketAPI.home).mapModels(type:SectionContent.self)
    }
    
    
    
}
