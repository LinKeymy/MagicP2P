//
//  Terror.swift
//  magic
//
//  Created by SteveLin on 2017/6/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import Moya

extension Response {
    // 对返回的StatusCode进行过滤
    func filterStatusCode() throws -> Response {
        guard (200...299).contains(statusCode) else {
            throw parseError()
        }
        return self
    }
    
    func parseError() -> TError {
        if self.statusCode >= 500 {
            return TError.network(code: statusCode)
        } else if (400...499).contains(statusCode) {
            if statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: UserShouldLoginNotification), object: nil, userInfo: nil)
            }
            let json = JSON(data)
            let message = json["message"].string
            return .business(code: self.statusCode, message: message)
        } else {
            return .undefine
        }
    }
}

enum TError: Swift.Error {
    
    case business(code:Int , message:String?)
    case network(code:Int)
    case jsonForm
    case undefine
}

extension Swift.Error {
    var message:String? {
        if let error = self as? TError {
            if case let .business(_ ,message) = error {
                return message
            }
        }
        return nil
    }
    var code :Int? {
        if let error = self as? TError {
            if case let .business(code ,_) = error {
                return code
            }
        }
        return nil
    }
}


//暂时忽略 如下的分类处理，想不到如何结合在一起
//enum RequestError : Swift.Error {
//    // Can't connect to the server (maybe offline?)
//    case connectionError(error: NSError)
//    // The server responded with a non 200 status code
//    case serverError(statusCode: Int, error: NSError)
//    // We got no data (0 bytes) back from the server
//    case noDataError
//    // The server response can't be converted from JSON to a Dictionary
//    case JSONSerializationError(error: Swift.Error)
//    // The Argo decoding Failed
//    case JSONMappingError(converstionError: Swift.Error)
//}
