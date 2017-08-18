//
//  Alertable.swift
//  magic
//
//  Created by SteveLin on 2017/7/25.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation

protocol Alertable {
    func alert(message:String?)
    func alert(title:String?, message:String?)
}

extension Alertable where Self:UIViewController {
    
    func alert(message:String?) {
        self.alert(title: "提示", message: message)
    }
    
    func alert(title:String?, message:String?)  {
        let alert = UIAlertController(title: title, message:message , preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}


extension UIViewController: Alertable { }
