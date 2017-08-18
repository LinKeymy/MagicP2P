//
//  Router.swift
//  magic
//
//  Created by SteveLin on 2017/5/22.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation


let AppRouteScheme = "touzhijia";
let HttpRouteScheme = "http";
let HttpsRouteScheme = "https";


class Router:JLRoutes {
    
    private lazy var routeInfo:[String:String] =  {
        guard let path = Bundle.main.path(forResource: "router.plist", ofType: nil),
            let dict = NSDictionary(contentsOfFile: path),
            let sdict = dict as? [String: String] else {
                return [String:String]();
        }
        return sdict
    }()
    
    open class func engineStart() {
        let router = Router.appRoutes
        for (key, _) in router.routeInfo {  router.addPattern(pattern: key) }
    }
    
    open class func open(_ urlString:String) {
        let isWeblink = urlString.hasPrefix(HttpRouteScheme + "://") || urlString.hasPrefix(HttpsRouteScheme + "://")
        isWeblink ? openWeb(urlString) : openNative(urlString)
    
    }
    
    // 打开Native页
    private static func openNative(_ urlString:String) {
        if let url = URL(string: urlString) { _ = Router.routeURL(url) }
    }
    
    // 打开Web页
    private static func openWeb(_ urlString:String) {
        var urlString = urlString
        if let authKey = UserAccount().auth_key {
            urlString = urlString + "?auth_key=" + authKey
        }
        let webVc = WebViewVC(url: urlString)
        currentViewController()?.navigationController?.pushViewController(webVc, animated: true)
    }
    
    // 打印router地址，查看是否是同一个 print(Unmanaged.passUnretained(router).toOpaque())
    open class var appRoutes:Router { return Router(forScheme:AppRouteScheme) }
    
    override var description: String { return super.description }
    
    open class func register(name:String, pattern:String) {
        self.appRoutes.register(className: name, pattern: pattern)
    }
    
    func register(className:String, pattern:String) {
        routeInfo[pattern] = className
    }
    
    func addPattern(pattern:String) {
        Router.appRoutes.addRoute(pattern) { [weak self] (parameter:[String : Any]) -> Bool in
            guard let obj = self?.controller(route: pattern, parameters: parameter) else {
                return false
            }
            if pattern == "platform/bind" {
                let sel = NSSelectorFromString("bind")
                if obj.responds(to: sel) {
                    obj.perform(sel)
                }
            } else {
                currentViewController()?.navigationController?.pushViewController(obj, animated: true)
            }
            return true
        }
    }
    
    func controller(route:String,parameters:[String:Any]) -> UIViewController? {
        guard let name = routeInfo[route],
            let cls = NSClassFromString(Bundle.main.namespace + "." + name) as? UIViewController.Type else {
                return nil
        }
        let vc = cls.init()
        for (key, value) in parameters {
            if (class_getProperty(cls, key)) != nil {
                vc.setValue(value, forKey: key)
            }
        }
        return vc
    }
}
