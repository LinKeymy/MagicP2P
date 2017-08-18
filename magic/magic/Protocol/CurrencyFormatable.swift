//
//  CurrencyFormatable.swift
//  magic
//
//  Created by SteveLin on 2017/7/25.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation

/// 金额的格式化
protocol CurrencyFormatable {
    var currencyUnit: String { get }
    var currency:String { get }
}

extension CurrencyFormatable {
    var currencyUnit: String {
        return currency + "元"
    }
}

extension String: CurrencyFormatable {
    var currency: String {
        if let n = Double(self) {
           return centsToPresentableChinaYuanString(n)
        } else {
            return ""
        }
    }
}

extension Double: CurrencyFormatable {
    var currency: String {
        return centsToPresentableChinaYuanString(self)
    }
}

fileprivate func createFormatter(_ currencySymbol: String) -> NumberFormatter {
    let newFormatter = NumberFormatter()
    newFormatter.locale = Locale.current
    newFormatter.currencySymbol = currencySymbol
    newFormatter.numberStyle = .currency
    newFormatter.maximumFractionDigits = 2
    newFormatter.minimumFractionDigits = 2
    newFormatter.alwaysShowsDecimalSeparator = false
    return newFormatter
}

fileprivate func centsToPresentableChinaYuanString(_ cents: Double, currencySymbol: String = "",positiveSuffix:String = "") -> String {
    let formatter = createFormatter(currencySymbol)
    formatter.positiveSuffix = positiveSuffix
    guard let chinaYuan = formatter.string(from: NSNumber(value:cents.roundTo(places: 2))) else {
        return ""
    }
    return chinaYuan
}

