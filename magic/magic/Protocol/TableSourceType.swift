//
//  TableSourceType.swift
//  magic
//
//  Created by SteveLin on 2017/6/16.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import RxSwift


protocol TableSourceType {
    associatedtype  E
    var numberOfSections:Int { get }
    func numberOfRows(in section:Int) -> Int
    var numberOfSources: Int { get }
    var sources:[E] { get }
    var showSpinner: Observable<Bool> { get }
    var updatedSources: Observable<Bool> { get }
    // have no default implemetation
    var sourcesble: Variable<[E]> { get set }
}

extension TableSourceType {
    var numberOfSections: Int { return 1 }
    func numberOfRows(in section:Int = 0) -> Int {
        return sourcesble.value.count
    }
    var numberOfSources: Int {
        return sourcesble.value.count
    }
    var sources: [E] { return sourcesble.value }
    var showSpinner: Observable<Bool> {
        return sourcesble.asObservable().map { $0.count == 0  }
    }
    var updatedSources: Observable<Bool> {
        return sourcesble.asObservable().map { _ in return true }
    }
}



