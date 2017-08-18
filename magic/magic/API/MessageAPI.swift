//
//  MessageAPI.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya



enum MessageAPI {
    case messages //注册
    case detail(id:String, start:Int, limit:Int)
    case didRead(id:String)
}

extension MessageAPI:CoustomTargetType {
    
    var baseURL: URL { return URL(string: TServiceAddress)! }
    
    var path: String  {
        switch self {
        case .didRead(let id):
            return "messages/" + id
        case .detail(let id , _ , _ ):
            return "messages/" + id
        default:
            return "messages"
        }
         }
    
    var method: Moya.Method {
        switch self {
        case .didRead:
            return .post
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .detail(_ , let start, let limit):
            return ["start":"\(start)","limit":"\(limit)"]
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .detail(_,_,_):
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    /// stub data 用来测试
    var sampleData: Data { return stubbedResponse("Message") }
    
    var task: Task {return .request}
    
}
