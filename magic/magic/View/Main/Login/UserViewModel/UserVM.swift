//
//  UserVM.swift
//  magic
//
//  Created by SteveLin on 2017/5/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import SwiftyJSON
import ResponseDetective

class UserVM {
    private lazy var UserProvider:RxMoyaProvider<TUser> = {
        let provider =  RxMoyaProvider<TUser>()
        let configuration = provider.manager.session.configuration
        ResponseDetective.enable(inConfiguration: configuration)
        return provider
    }()
    
    func signIn(name:String, passwd:String) -> Observable<UserAccount> {
       return Network<TUser>.request(.signIn(name: name, passwd: passwd)).result(type: UserAccount.self)
    }
    
}
