//
//  Network.swift
//  magic
//
//  Created by SteveLin on 2017/5/29.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire
import ResponseDetective



// OnlineProvider 提供了基本底层的默认的网络请求
class OnlinePro<Target>: RxMoyaProvider<Target> where Target: CoustomTargetType {
    fileprivate let online: Observable<Bool>
    
    init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
         requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
         stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
         manager: Manager = detectiveManager(),
         plugins: [PluginType] = [NetworkLogger()],
         trackInflights: Bool = false,
         online: Observable<Bool> = connectedToInternetOrStubbing()) {
        
        self.online = online
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }
    
    // take(x) 表示只处理前x个事件，ignore(fasle)表示忽略false的事件
    override func request(_ token: Target) -> Observable<Moya.Response> {
        let actualRequest = super.request(token)
        return online
            .ignore(value: false)  // 等待直到在线
            .take(1)        // Take 1  用于确认请求只会调用一次
            .flatMap { _ in // Turn the online state into a network request
                return actualRequest
        }
    }
}

protocol NetworkType {
    associatedtype T:CoustomTargetType
    var provider:OnlinePro<T> { get }
}


struct Network<target:CoustomTargetType>:NetworkType {
    typealias T = target
    let provider:OnlinePro<T>
}

extension NetworkType {
    
    static func defaultNetwork() -> Network<T> {
        return Network(provider:newProvider(configHeader()))
    }

    static  func request(_ token: T) -> Observable<Moya.Response> {
            return Network.defaultNetwork().provider.request(token)
    }
    
    // target -> endpoint
    static func endPointsClosure<T>(_ headerFields:[String: String]? = nil) -> (T) -> Endpoint<T> where T:CoustomTargetType {
        return { target in
            
            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
            var endpoint = Endpoint<T>(
                url: url,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                parameters: target.parameters,
                parameterEncoding: target.parameterEncoding
            )
            if let headerFields = headerFields {
               endpoint = endpoint.adding(newHTTPHeaderFields: headerFields)
            }
            return endpoint
        }
    }
    
    static func APIKeysBasedStubBehaviour(_ target: CoustomTargetType) -> Moya.StubBehavior {
        return target.stubBehavior
    }
    
}

private func newProvider<T>(_ headerfields:[String: String]? = nil) -> OnlinePro<T> {
    return OnlinePro(endpointClosure:Network<T>.endPointsClosure(headerfields), stubClosure: Network<T>.APIKeysBasedStubBehaviour)
}

// 配置用于打印网络
private func detectiveManager() -> Manager {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
    ResponseDetective.enable(inConfiguration: configuration)
    let manager = Manager(configuration: configuration)
    manager.startRequestsImmediately = false
    return manager
}

private func configHeader() -> [String:String] {
    var header = [String:String]()
    if let autkKey = UserAccount().auth_key,
        let originData = (autkKey + ":ios").data(using: String.Encoding.ascii) {
        let encodeResult = originData.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithLineFeed)
        let originStr = "Basic " + encodeResult
        header["Authorization"] = originStr
    }
    
    if let localVersion = Bundle.main.appVersion {
        header["X-version"] = localVersion
    }
    return header
}



func stubbedResponse(_ filename: String) -> Data! {
    return dataAtMainBundle(name: filename)
}
// MARK: - Provider support

private extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
