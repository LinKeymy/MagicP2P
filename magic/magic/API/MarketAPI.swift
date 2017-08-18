//
//  MarketAPI.swift
//  magic
//
//  Created by SteveLin on 2017/7/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation

import Moya

enum MarketAPI {
    case home
}

extension MarketAPI: CoustomTargetType {
    
    var stubBehavior: StubBehavior {
        switch self {
        case .home:
            return .immediate
        }
    }
    
    var baseURL: URL {
        return URL(string: TPlatV2Address)!
    }
    var path: String {
        switch self {
        case .home:
            return "/home"
        }
    }
    var method: Moya.Method {
        return .get
    }
    
    var parameters:[String : Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .home:
            return stubbedResponse("Market")
        }
    }
    
    var task: Task {return .request}
    
    
}
