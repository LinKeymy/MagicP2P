//
//  NetworkTools.swift
//  magic
//
//  Created by SteveLin on 2017/5/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkTooks {
    static func get(url:String,parameters:[String:Any]? = nil,finishedCallback:@escaping (_ result:Any?) -> ()) {
        
        var header = [String:String]()
        if let autkKey = UserAccount().auth_key,
        let originData = (autkKey + ":ios").data(using: String.Encoding.ascii) {
            let encodeResult = originData.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithLineFeed)
            let originStr = "Basic " + encodeResult
            header["Authorization"] = originStr
        }

        if let infoDict = Bundle.main.infoDictionary,
            let localVersion = infoDict["CFBundleShortVersionString"] as? String {
            header["X-version"] = localVersion
        }
        print("getheader:\(header)")
        Alamofire.request(url, method: .get, parameters: parameters, headers: header).responseJSON { (response) in
            print("response.response?.statusCode:\(response.response?.statusCode ?? 1000 )")
            codeHandle(code: response.response?.statusCode)
            guard let result = response.result.value else {
                print(response.result.error ?? "")
                finishedCallback(nil)
                return
            }
                finishedCallback(result)
        }.responseString { (response) in
            print("response.result:\(response.result)")
        }
    }
    
    static func post(url:String,parameters:[String:Any]? = nil,finishedCallback:@escaping (_ result:Any?) -> ()) {
        print("loginparameters:\(parameters ?? [:])")
        Alamofire.request(url, method: .post, parameters: parameters, encoding:JSONEncoding.default).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "")
                print(response)
                finishedCallback(nil)
                return
            }
            finishedCallback(result)
        }
    }
    
    static private func codeHandle(code:Int?) {
        guard let code = code else {
            return
        }
        if code == 401 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: UserShouldLoginNotification), object: nil)
        }
    }
}
