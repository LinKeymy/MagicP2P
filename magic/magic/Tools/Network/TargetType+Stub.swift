//
//  TargetType+Stub.swift
//  magic
//
//  Created by SteveLin on 2017/6/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Moya

extension TargetType {
    var stubBehavior: Moya.StubBehavior {
        return  APIKeys.sharedKeys.stubResponses ? .immediate : .never
    }
}

protocol CoustomTargetType: TargetType {
    var stubBehavior:Moya.StubBehavior { get }
}


