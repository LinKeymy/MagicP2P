//
//  TimeHelper.swift
//  magic
//
//  Created by SteveLin on 2017/6/2.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Timepiece

extension String {
    func MMddHHmm() -> String {
        if let date = date(inFormat:"MM-dd HH:mm") {
            return date.timeString(in :.full )
        }
        return self
    }
}
