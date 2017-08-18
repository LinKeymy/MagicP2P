//
//  ConponViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/6/14.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class CouponViewModel: TableSourceType {
    
    var sourcesble = Variable<[Coupon]>([])
    
    func updateCopons() {
       _ = fetchCopons().subscribe(onNext: { [weak self] in
            self?.sourcesble.value = $0
        })
    }
    
    func fetchCopons() -> Observable<[Coupon]> {
        return Network.request(AssetsAPI.coupon).mapModels(type: Coupon.self, listKey: "dataList")
    }
}
