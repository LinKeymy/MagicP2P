//
//  UserAccount.swift
//  magic
//
//  Created by SteveLin on 2017/5/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import YYModel
private let accountFile:NSString = "userAccount.json"
class UserAccount: NSObject {
    
    override var description: String{
        return userInfo?.yy_modelDescription() ?? ""
    }
    var auth_key:String?
    var userId:String?
    var userInfo:UserInfo?
    open class var isLogon:Bool {
        return UserAccount().auth_key != nil
    }
    
    override init() {
        super.init()
        guard let path = accountFile.appendDocumentDir(),
            let data = NSData(contentsOfFile: path as String),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any] else {
                return
        }
        yy_modelSet(with: dict ?? [:])
        print("从沙盒加载用户信息:\n \(self)")
    }
    
    /*
     1. 偏好设置(小数据)
     2.沙盒 - 归档／plist/json
     3.数据库(FMDB/CoreData)
     4.钥匙串访问(小数据／自动加密 - 需要使用框架 SSKeychain)
     */
    // 其实这里使用Archiver和UnArchiver去做encode和decode会比较好，然后UserAccount对象作为单例或者单例成员存在内存中
    // 不过暂时放在磁盘中同时用后销毁，这样不好，因为auth_key频繁访问到。
    // 当然不闲麻烦也可以用钥匙串访问
    func saveAccount() {
        var dict = self.yy_modelToJSONObject() as? [String: Any] ?? [:]
        dict.removeValue(forKey: "expires_in")
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let filePath = (accountFile as NSString).appendDocumentDir() else {
                return
        }
        (data as NSData).write(toFile: filePath as String, atomically: true)
        print("userAccount.json 保存成功 \(filePath)")
    }
    
    class func removeAccount() {
        guard let path = accountFile.appendDocumentDir() else {
            return
        }
        do {
            try FileManager.default.removeItem(atPath: path as String)
        } catch {
            print("fileError")
        }
    }
}
