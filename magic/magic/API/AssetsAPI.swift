//
//  AssetsAPI.swift
//  magic
//
//  Created by SteveLin on 2017/6/7.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya



enum AssetsAPI {
    case assets
    case detail(id:String, start:Int, limit:Int)
    case didRead(id:String)
    case coupon
    case selectedPage
}

extension AssetsAPI:CoustomTargetType {
    
    var stubBehavior: StubBehavior {
        switch self {
        case .coupon:
            return .never
        default:
            return  .immediate
        }
    }
    
    var baseURL: URL { return URL(string: TServiceAddressV2)! }
    
    var path: String  {
        switch self {
        case .assets:
            return "assets"
        case .detail(let id , _ , _ ):
            return "messages/" + id
        case .coupon:
            return "vouchers"
        case .selectedPage:
            return "selectedPage"
        default:
            return "assets"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .assets:
            return .get
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
            return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// stub data 用来测试
    var sampleData: Data {
        switch self {
        case .selectedPage:
            return stubbedResponse("SelectedHomePage")
        default:
            return stubbedResponse("AssetsList")
        }
    }
    
    var task: Task {return .request}
    
}
