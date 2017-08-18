//
//  BidViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/5/29.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Moya
import RxSwift


class BidViewModel {
    let imageLinks = Variable<[ImageLinkModel]>([])
    func getBanner() -> Observable<[ImageLinkModel]> {
        return TRecommendProvider.request(.banner).mapModels(type: ImageLinkModel.self)
    }
    
    func fecthContent() -> Observable<[SectionContent]> {
        return Network.request(BidAPI.bidHome).mapModels(type:SectionContent.self)
    }

}
