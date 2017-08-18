//
//  TUser.swift
//  magic
//
//  Created by SteveLin on 2017/5/12.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Moya


//let TUserProvider = <CoustomTargetType>()


enum TUser {
    case signIn(name:String,passwd:String) //登录
    case signUp //注册
    case signOut //退出登录
}

extension TUser:CoustomTargetType {

    var baseURL: URL {
        return URL(string: TServiceAddress)!
    }

    var path: String  {
        switch self {
        case .signIn:
            return "login"
        case .signUp:
            return "login"
        case .signOut:
            return "logout"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .signIn(let name, let passwd):
            return ["username":name,"password":passwd]
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    /// stub data 用来测试
    var sampleData: Data { return "".data(using: .utf8)! }
    
    var task: Task {return .request}

}
