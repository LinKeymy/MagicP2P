//
//  RenewViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class RenewViewModel: TableSourceType {
    
    var sourcesble = Variable<[RenewBid]>([])
    
    func updateRenewList() {
      _ =  fetchRewlist().subscribe(
            onNext: { [weak self] in
        self?.sourcesble.value = $0
        })
    }
    
    func fetchRewlist() -> Observable<[RenewBid]>  {
      return  Network.request(SelfProduct.renew(page: 1, per_page: 10)).mapModels(type: RenewBid.self, listKey: "dataList")
    }

}
