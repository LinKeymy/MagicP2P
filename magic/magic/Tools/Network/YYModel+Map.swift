//
//  YYModel+Map.swift
//  magic
//
//  Created by SteveLin on 2017/5/12.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Moya
import RxSwift
import YYModel
import SwiftyJSON

public protocol Modelable {
   static func model(with dictionary: [AnyHashable : Any]) -> Self?
}

extension NSObject: Modelable {
    open class func model(with dictionary: [AnyHashable : Any]) -> Self? {
        return  self.yy_model(with: dictionary)
    }
}

// request的数据初步处理
extension Observable where E == Response {
    
    public func mapModel<T: Modelable>(type: T.Type) -> Observable<T> {
        return result(type: type)
    }
    
    public func result<T: Modelable>(type: T.Type) -> Observable<T> {
        return self.filterStatusCodes().mapJSON().map{ json in
            guard let jsonDict = json as? [String:Any],
                let model = type.model(with: jsonDict) else {
                    throw TError.jsonForm
            }
            return model
        }
    }

    public func mapModels<T: Modelable>(type: T.Type, listKey:String = "datalist") -> Observable<[T]> {
        
        return self.filterStatusCodes().map { response in
            guard let result = try response.mapJSON() as? [String:Any],
                let dicts = result[listKey] as? [[String: Any]] else {
                    throw TError.jsonForm
            }
            var models = [T]()
            for dict in dicts {
                if let model = type.model(with: dict) {
                    models.append(model)
                }
            }
            return models
        }
    }
}

extension ObservableType where Self.E == Moya.Response {
    public func filterStatusCodes() -> Observable<E> {
        return flatMap { response -> Observable<E> in
            return Observable.just(try response.filterStatusCode())
        }
    }
}

