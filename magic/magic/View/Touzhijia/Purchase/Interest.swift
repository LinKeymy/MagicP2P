//
//  Interest.swift
//  magic
//
//  Created by SteveLin on 2017/7/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


// 回款类型
enum RepayType:Int {
    case monthlyPaymentDue = 0 //每月付息，到期还本
    case repayLoanAndAccruedInterestOutright //到期还本付息
    case averageCapitalPlusInterest //等额本息
}


// 理财券类型
enum CouponType {
    case withdraw //提现券
    case cash         //现金券
    case platPlusRate //平台加息券
    case tzjPlusRate(value:Double)  //投之家加息
    case redPacket(value:Double)    //红包券
}

// 对double类型保留小数位的函数
extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ((self * divisor).rounded() / divisor) * 1.00
    }
    
}

// 不同的回款方式会影响计息的公式，不会影响本金和利率的大小，又由于不同的回款方式对应的计息公式基本不会改变
// 所以先根据不同的因素(券的作用)得到最后的本金和利率，将得到后的本金和利率根据不同的计息方式算得最后的收益
// 这样就可以做到不管券的作用如何改变，都只会影响本金和利率，不会影响第二步不同的回款方式的计算

struct Interest {

    private var value:Double = 0.0
    private var coupon:CouponType?
    private var capital:Double = 0.0
    private var plusCapital:Double = 0.0
    private var period:Double = 0
    private var periodUnit:String = "天"
    
    init(repay:RepayType, coupon: CouponType, capital:Double, maxCapital:Double?, rate:Double,period:Double,periodUnit:String) {
        self.capital = capital
        self.plusCapital = Interest.capital(coupon: coupon, capital:capital, maxCapital:maxCapital)
        self.coupon = coupon
        self.period = period
        self.periodUnit = periodUnit
        let value1 = Interest.interest(repay: repay, capital: capital, rate: rate, periodUnit: periodUnit, period: period)
        value = value1.roundTo(places: 2)
    }
    
    
    
    static func interest(repay:RepayType,capital:Double, rate:Double, periodUnit:String, period:Double) ->Double {
        return repay == .averageCapitalPlusInterest ?
        averageCapitalPlusInterest(capital: capital, rate: rate, period: period) :
        unAverageCapitalPlusInterest(capital: capital, rate: rate, periodUnit: periodUnit, period: period)
    }
    
    // 券对本金的影响
    static func capital(coupon:CouponType,capital:Double, maxCapital:Double?) -> Double {
        var capital = capital
        switch coupon {
        case .redPacket( let value):
            capital = capital + value
        default: break
        }
        if let maxCapital = maxCapital {
            return capital > maxCapital ? maxCapital : capital
        } else {
            return capital
        }
    }
    // 券和回款对利率的影响
    static func rate(coupon:CouponType,rate:Double) -> Double {
        switch coupon {
        case .tzjPlusRate( let value):
             return rate + value
        default:
            return rate
        }
    }
    
    // 等额本息收益的计算
    static func averageCapitalPlusInterest(capital:Double, rate:Double, period:Double) -> Double {
        
        let mensalRate = rate / (12.0 * 100.0)
        let mensalRepayment = capital * (mensalRate * pow(1 + mensalRate, period)) / ((pow(mensalRate + 1, period) ) - 1)
        return mensalRepayment * period - capital
        
    }
    // 非等额本息的计算
    static func unAverageCapitalPlusInterest(capital:Double, rate:Double, periodUnit:String, period:Double) -> Double {
        print("\(rate)")
        let factor:Double = periodUnit.characters.count > 1 ? 12 : 365
        print("rate: \(rate) factor: \(factor)")
        return (rate / 100 * capital * period / factor)
    }
    
    var moneyValue:String {
        return stringValue
    }
    
    var stringValue:String {
        return String(format: "%.2f", doubleValue)
    }
    
    var doubleValue:Double {
        return value
    }
    
    var plusMoneyValue:String {
        return plusStringValue
    }
    
    var plusDoubleValue:Double {
        var plusValue = 0.01
        if let coupon = coupon {
            switch coupon {
            case .tzjPlusRate(let value):
                plusValue = Interest.unAverageCapitalPlusInterest(capital: plusCapital, rate: value, periodUnit: periodUnit, period: period)
            default: break
           }
        }
        return plusValue
    }
    
    var plusStringValue:String {
        return String(format: "%.2f", plusDoubleValue)
    }
    
}
