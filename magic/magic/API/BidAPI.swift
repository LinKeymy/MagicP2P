//
//  BidAPI.swift
//  magic
//  Created by SteveLin on 2017/5/29.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya


let pageSize = 10

enum BidAPI {
    case banner //注册
    case bidProject(sorttype:String, sortorder:String, page:Int)
    case bidNewbie
    case bidHome
}



extension BidAPI: CoustomTargetType {
    var stubBehavior: Moya.StubBehavior {
        switch self {
        case .bidHome:
            return .immediate
        default:
            return .never
        }
    }
}

extension BidAPI:TargetType {
    
    var baseURL: URL {
        return URL(string: TPlatV2Address)!
    }
    
    var path: String  {
        switch self {
        case .banner: return "banners/v4"
        case .bidProject: return "/api/project"
        case .bidNewbie: return "/api/new"
        case .bidHome: return "bid/home"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .bidProject(let sorttype, let  sortorder, let page):
            return ["sorttype":sorttype,"sortorder":sortorder,"page":page,"pageSize":pageSize]
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// stub data 用来测试
    var sampleData: Data { return stubbedResponse("BidsPage") }
    
    var task: Task {return .request}
    
}
