//
//  PurchaseController.swift
//  magic
//
//  Created by SteveLin on 2017/7/18.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


class CustomTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func drawPlaceholder(in rect: CGRect) {
        super.drawPlaceholder(in: CGRect(x: 0, y: self.frame.height * 0.5, width: 0, height: 0))
    }
}

class PurchaseController: UIViewController {

    @IBOutlet weak var purchaseAmountTextF: UITextField!
    @IBOutlet weak var incomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "定期购买"
        purchaseAmountTextF.becomeFirstResponder()
        purchaseAmountTextF.attributedPlaceholder = NSAttributedString(string: "1元起投", attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 18)])
    }
    @IBAction func recharge(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Balance", bundle: nil).instantiateViewController(withIdentifier: "BalanceRechargeViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func amountChanged(_ sender: UITextField) {
        incomLabel.text = expectInterest(capital: sender.text,
                                         repay: .monthlyPaymentDue,
                                         coupon: .tzjPlusRate(value: 1),
                                         maxCapital: 100000,
                                         rate: 7.90,
                                         period: 2,
                                         periodUnit: "个月")
    }
    
    private func expectInterest(capital:String?,repay:RepayType, coupon: CouponType, maxCapital:Double?, rate:Double,period:Double,periodUnit:String) -> String {
        if let text = capital,
            let capital = Double(text) {
            let interest = Interest(repay: repay, coupon: coupon, capital: capital, maxCapital: maxCapital, rate: rate, period: period, periodUnit: periodUnit)
            return "预计收益 " + interest.stringValue + "  加息奖励 " + interest.plusStringValue
        } else {
            return "预计收益 0.00"
        }
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
