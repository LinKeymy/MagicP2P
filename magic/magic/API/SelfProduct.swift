//
//  SelfProduct.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation



import Foundation
import Moya

enum SelfProduct {
    case renew(page:Int,per_page:Int)

}

extension SelfProduct:CoustomTargetType {
    
    var stubBehavior: StubBehavior {
        switch self {
        case .renew:
            return .immediate
        }
    }
    
    var baseURL: URL { return URL(string: TServiceAddressV2)! }
    
    var path: String  {
        switch self {
        case .renew:
            return "/asset/renewal_list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .renew:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .renew(let page, let per_page):
            return ["page":page,"per_page":per_page]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// stub data 用来测试
    var sampleData: Data { return stubbedResponse("RenewList") }
    
    var task: Task { return .request }
    
}
