//
//  Introduce.swift
//  magic
//
//  Created by SteveLin on 2017/8/11.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import SwiftyUserDefaults



/// 使用模版 大概如下
//if !Introduce.register.isShowed {
//    Introduce.register.show(on: view)
//}
//if Introduce.register.isNotShowed {
//    Introduce.register.show(on: view)
//}
// 上面如果不是默认居中，就提供frame参数，如果有事件处理可以添加action的闭包
struct Introduce {
    
    static var wallet: IntroduceShow.Type {
        get {
            IntroduceShow.showKey = DefaultsKey<Bool>.isWalletShowed._key
            return IntroduceShow.self
        }
    }
    
    static var debt: IntroduceShow.Type {
        get {
            IntroduceShow.showKey = DefaultsKey<Bool>.isDebtShowed._key
            return IntroduceShow.self
        }
    }
    
    static var platform: IntroduceShow.Type {
        get {
            IntroduceShow.showKey = DefaultsKey<Bool>.isPlatShowed._key
            return IntroduceShow.self
        }
    }
    
    static var register: IntroduceShow.Type {
        get {
            IntroduceShow.showKey = DefaultsKey<Bool>.isRegisterShowed._key
            return IntroduceShow.self
        }
    }
}

struct IntroduceShow {
    
    fileprivate static var showKey: String = "" {
        didSet {
            print("showkey:\(showKey)")
        }
    }
    
    static var isShowed: Bool {
        get {
            return Defaults[DefaultsKey(showKey)]
        }
        set {
            Defaults[DefaultsKey(showKey)] = newValue
        }
    }
    
    static var isNotShowed: Bool {
        get {
            return !isShowed
        }
        set {
            isShowed = !newValue
        }
    }
    
    static func show(on view: UIView,frame: CGRect? = nil,action: (()->())? = nil) {
        deLog("\(view)")
        // TODO 显示弹窗的内容到 view 上
        Defaults[DefaultsKey(showKey)] = true
    }
}

extension DefaultsKeys {
   fileprivate static let isWalletShowed    = DefaultsKey<Bool>("isWalletShowed")
   fileprivate static let isDebtShowed      = DefaultsKey<Bool>("isDebtShowed")
   fileprivate static let isPlatShowed      = DefaultsKey<Bool>("isPlatShowed")
   fileprivate static let isRegisterShowed  = DefaultsKey<Bool>("isRegisterShowed")
}

