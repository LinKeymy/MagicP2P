//
//  TRecommend.swift
//  magic
//
//  Created by SteveLin on 2017/5/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Moya
import ResponseDetective
import Alamofire

let TRecommendProvider:RxMoyaProvider<TRecommend> = {
    let provider = RxMoyaProvider<TRecommend>(manager:responseDetectiveDefaultr())
    return provider
}()
    func responseDetectiveDefaultr() -> Manager {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
    ResponseDetective.enable(inConfiguration: configuration)
    let manager = Manager(configuration: configuration)
    manager.startRequestsImmediately = false
    return manager
}


enum TRecommend {
    case banner
    case signUp //注册
    case signOut //退出登录
    case home
}


extension TRecommend: CoustomTargetType {
    
    var baseURL: URL {
        return URL(string: TServiceAddress)!
    }
    
    var path: String  {
        switch self {
        case .banner:
            return "banners/v4"
        case .signUp:
            return "login"
        case .signOut:
            return "logout"
        case .home:
            return "home"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .home:
            return .get
        default:
            return .post
        }
        
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .banner:
            return nil
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// stub data 用来测试
    var sampleData: Data { return stubbedResponse("Recommended") }
    
    var task: Task { return .request }
    
    var stubBehavior: StubBehavior {
        switch self {
        case .home:
            return .immediate
        default:
            return .never
        }
    }
    
}

