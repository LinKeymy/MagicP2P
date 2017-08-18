//
//  UserVMSpec.swift
//  magic
//
//  Created by SteveLin on 2017/5/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//


import Quick
import Nimble
import RxSwift

@testable import magic


class UserVMSpec: QuickSpec {
    
    override func spec() {
        let bag = DisposeBag()
        var userVm:UserVM!
        beforeEach {
            userVm = UserVM()
        }
        
        describe("user signing In") {
            it("failured because parameter not right") {
                var errorCode:Int? = 0
                userVm.signIn(name: "13168705790", passwd: "617982anh").debug().subscribe(onError:{
                            errorCode = $0.code
                    }).addDisposableTo(bag)
                expect(errorCode).toEventually(equal(400), timeout: 20, pollInterval: 0.2)
            }
            it("successed") {
                var userac:UserAccount?
                userVm.signIn(name: "13168705790", passwd: "617982anh").debug().subscribe(onNext:{
                    userac = $0
                }).addDisposableTo(bag)
                expect(userac).toEventually((beNil()), timeout: 20, pollInterval: 0.2, description: "auth_key 为空")
                print("userac?.auth_key:\(String(describing: userac))")
            }
        }
    }
}
