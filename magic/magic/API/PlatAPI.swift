//
//  PlatAPI.swift
//  magic
//
//  Created by SteveLin on 2017/6/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya

enum PlatAPI {
    case home
    case filter
    case category
    case safetyRating
    case background
    case depository
}

extension PlatAPI: CoustomTargetType {
    
    var stubBehavior: StubBehavior {
        switch self {
        case .home, .safetyRating, .background , .depository:
            return .immediate
        default:
            return .never
        }
    }
    
    var baseURL: URL {
        return URL(string: TPlatV2Address)!
    }
    var path: String {
        switch self {
        case .home:
           return "/home"
        case .filter:
            return "/filter"
        case .category:
            return "/category"
        case .safetyRating:
            return "safetyRating"
        case .background:
            return "background"
        case .depository:
            return "depository"
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
            return stubbedResponse("PlatTodayTurnover")
        case .safetyRating:
            return stubbedResponse("SafetyRating")
        case .background:
            return stubbedResponse("PlatBackground")
        case .depository:
            return stubbedResponse("Depository")
        default:
            return "".data(using: .utf8)!
        }
    }
    
    var task: Task {return .request}

}
