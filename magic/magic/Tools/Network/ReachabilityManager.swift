//
//  ReachabilityManager.swift
//  magic
//
//  Created by SteveLin on 2017/8/7.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import ReachabilitySwift
import RxSwift

//ReachabilitySwift 貌似现在这个第三方访问了私有API，苹果会拒
class ReachabilityManager {
    
    private let reachability: Reachability
    
    let _reach = ReplaySubject<Bool>.create(bufferSize: 1)
    var reach: Observable<Bool> {
        return _reach.asObservable()
    }
    
    init?() {
        guard let r = Reachability() else {
            return nil
        }
        self.reachability = r
        do {
            try self.reachability.startNotifier()
        } catch {
            return nil
        }
        self._reach.onNext(self.reachability.isReachable)
        
        self.reachability.whenReachable = { _ in
            DispatchQueue.main.async { self._reach.onNext(true) }
        }
        self.reachability.whenUnreachable = { _ in
            DispatchQueue.main.async { self._reach.onNext(false) }
        }
    }
    
    deinit {
        reachability.stopNotifier()
    }
}
