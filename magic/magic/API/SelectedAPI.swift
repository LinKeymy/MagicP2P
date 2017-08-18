//
//  SelectedAPI.swift
//  magic
//
//  Created by SteveLin on 2017/6/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//


import Foundation
import Moya



enum SelectedAPI {
    
    enum Platform:String {
        case product = "product"
        case detect = "detect"
        case account = "account"
    }
    case list
    case platform(name:String,tab:Platform)
}

extension SelectedAPI: CoustomTargetType {
    var stubBehavior: Moya.StubBehavior {
        switch self {
        case .platform(_: _):
            return .immediate
        default:
            return .never
        }
    }
}

extension SelectedAPI:TargetType {
    
    var baseURL: URL {
        return URL(string: TPlatV2Address)!
    }
    
    var path: String  {
        switch self {
        case .platform(let name, let tab) :
            return "\(name)/" + tab.rawValue
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
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
        case .platform(_, let tab):
            switch tab {
            case .product:
                 return stubbedResponse("TZJProduct")
            case .detect:
                return stubbedResponse("TouzhijiaDetect")
            case .account:
                return stubbedResponse("TouzhijiaAccount")
            }
        default:
            return "".data(using: .utf8)!
        }
    }
    
    var task: Task {return .request}
    
}
