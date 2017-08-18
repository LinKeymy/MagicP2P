//
//  RecommendVM.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
import UIKit
import Moya
import RxSwift

//class RecommendVM {
//    let imageLinks = Variable<[ImageLinkModel]>([])
//    func getBanner() -> Observable<[ImageLinkModel]> {
//        return TRecommendProvider.request(.banner).mapModels(type: ImageLinkModel.self)
//    }
//}
//


class RecommendVM {
    
    func fecthContent() -> Observable<[SectionContent]> {
        return Network.request(TRecommend.home).mapModels(type:SectionContent.self)
    }
}
