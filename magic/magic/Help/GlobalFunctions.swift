//
//  GlobalFunctions.swift
//  magic
//
//  Created by SteveLin on 2017/5/23.
//  Copyright © 2017年 SteveLin. All rights reserved.
//
import RxSwift
import ReachabilitySwift
import Moya
import ChameleonFramework


// HexColor generic function
func THexColor(_ hexString: String, _ alpha: CGFloat = 1.0) -> UIColor? {
    return HexColor(hexString, alpha)
}
// get a object from main bundle
func objectFromMainBundle(fileName:String) -> Any? {
    guard let path = Bundle.main.path(forResource: fileName, ofType: nil),
        let data = NSData(contentsOfFile: path),
        let object = try? JSONSerialization.jsonObject(with: data as Data, options: []) else {
            return nil
    }
    return object
}
// get data from main bundle
func dataAtMainBundle(name: String) -> Data {
    guard let path = Bundle.main.path(forResource: name, ofType: "json"),
        let data = NSData(contentsOfFile: path) else {
            return Data()
    }
    return data as Data
}

// Ideally a Pod. For now a file.
func delayToMainThread(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter (
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}


// print infomation to console
func deLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    let file = String(fileName.characters.split(separator: "/").last ?? fileName.characters)
    print(" 文件:\(file) 方法:\(methodName)  行号:\(lineNumber)\n打印信息:\(message)");
}

// write infomation to file
func logPath() -> URL {
    let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    return docs.appendingPathComponent("logger.txt")
}

let logger = Logger(destination: logPath())

private let reachabilityManager = ReachabilityManager()



// An observable that completes when the app gets online (possibly completes immediately).
func connectedToInternetOrStubbing() -> Observable<Bool> { // 连接网络或者拦截
    
    let stubbing = Observable.just(APIKeys.sharedKeys.stubResponses)
    
    guard let online = reachabilityManager?.reach else {
        return stubbing
    }
    return [online, stubbing].combineLatestOr()
}

func responseIsOK(_ response: Response) -> Bool {
    return response.statusCode == 200
}


// 查看是否是开发环境
func detectDevelopmentEnvironment() -> Bool {
    var developmentEnvironment = false
    #if DEBUG || (arch(i386) || arch(x86_64)) && os(iOS)
        developmentEnvironment = true
    #endif
    return developmentEnvironment
}

// 如果是 DEBUG 就让程序崩溃，否则就打印错误
func bindingErrorToInterface(_ error: Swift.Error) {
    let error = "Binding error to UI: \(error)"
    #if DEBUG
        fatalError(error)
    #else
        print(error)
    #endif
}

// Applies an instance method to the instance with an unowned reference.
func applyUnowned<Type: AnyObject, Parameters, ReturnValue>(_ instance: Type, _ function: @escaping ((Type) -> (Parameters) -> ReturnValue)) -> ((Parameters) -> ReturnValue) {
    return { [unowned instance] parameters -> ReturnValue in
        return function(instance)(parameters)
    }
}
