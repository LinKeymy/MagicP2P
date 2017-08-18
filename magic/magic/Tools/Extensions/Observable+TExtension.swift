//
//  Observable+TExtension.swift
//  magic
//
//  Created by SteveLin on 2017/5/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    public func subscribeDefault(onNext: ((E) -> Void)? = nil, onDisposed: (() -> Void)? = nil)
        -> Disposable {
           return self.debug().subscribe(onNext: onNext, onError: {
                currentViewController()!.alert(message: $0.message)
            }, onDisposed: onDisposed)
            
        }
}




