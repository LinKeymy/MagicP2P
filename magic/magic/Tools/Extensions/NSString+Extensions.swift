//
//  NSString+Extensions.swift
//  magic
//
//  Created by SteveLin on 2017/7/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation


extension NSString {
    func appendDocumentDir() -> NSString? {
        if let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last as NSString? {
         return  dir.appendingPathComponent(lastPathComponent) as NSString
        }
        return nil
    }
    
    func appendCacheDir() -> NSString? {
        if let dir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last as NSString? {
            return  dir.appendingPathComponent(lastPathComponent) as NSString
        }
        return nil
    }
    
    func appendTempDir() -> NSString {
      return  (NSTemporaryDirectory() as NSString).appendingPathComponent(lastPathComponent) as NSString
    }

}
