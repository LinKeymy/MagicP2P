//
//  MessageViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/6/12.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import Timepiece

class MessageViewModel {
    var message:Message
    // 这里设置为存储型属性，不设置为计算型的属性，是用内存换计算的性能
    // 这样不用滚动的时候，每次都重复同样的计算
    var id:Int?
    var title:String?
    var contentDesc: String?
    var iconURL:URL?
    var time:String?
    var dayString:String
    var pictureViewSize = CGSize()
    var cellHeight: CGFloat = 0
    init(message:Message) {
        self.message = message
        time = message.createAt?.substring(from: "2017-06-12 ".endIndex)
        id = message.id
        
        if let day = message.createAt?.substring(to: "2017-06-12".endIndex) {
            dayString = " " + day + " "
        } else {
            dayString = ""
        }
        if let content = message.contents?.first {
            title =  content.title
            contentDesc = content.desc
            if let banner = content.banner {
                iconURL = URL(string:banner)
                pictureViewSize = CGSize(width: kScreenW - 50, height: 8 + (kScreenW - 50) * ( 150 / 315.0 ))
            }
        }
        caculateCellHeight()
    }
    
    func caculateCellHeight() {
        cellHeight = 20 + 10 + 14.5 + 10 + pictureViewSize.height
        let textSize = CGSize(width: kScreenW - 50, height: CGFloat(10000))
        let titleFont = UIFont.systemFont(ofSize: 15)
        let descFont = UIFont.systemFont(ofSize: 14)
        if let contentStr = contentDesc {
            print("contentDesc:\(contentStr)")
            let contentSize = (contentStr as NSString).boundingRect(with: textSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName: descFont], context: nil)
            print("contentDescWidth:\(contentSize)")
            cellHeight = cellHeight + contentSize.height
        }
        if let  title = title {
            let titleSize = (title as NSString).boundingRect(with: textSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName: titleFont], context: nil)
            print("titleH:\(titleSize)")
            cellHeight = titleSize.height + cellHeight
        }
        cellHeight = cellHeight + 8 + 10 + 40
    }
}


