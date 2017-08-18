//
//  MessageCell.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

extension String {
    func delete(prefix:String) -> String {
        return substring(from: prefix.endIndex)
    }
    
    var base64Image:UIImage {
        if let data = Data(base64Encoded: self, options: []),
            let image = UIImage(data:data) {
            return image
        }
        return UIImage()
    }
    
    func deletePrefixForBase64Image() -> String {
      return delete(prefix: "data:image/png;base64,")
    }
}

class MessageCell: UITableViewCell {

    
    var source:MessageSource? {
        didSet {
            guard let source = source else {
                return
            }
            icon.image = source.icon?.delete(prefix: "data:image/png;base64,").base64Image
            briefLabel.text = source.head
            timeLabel.text = source.messages?.first?.createAt?.MMddHHmm()
            sourceLabel.text = source.name
            unreadCount = source.unread ?? 0
        }
    }
    
    var unreadCount:Int {
        get { return 0 }
        set (newVaule) {
            var unread = String(newVaule)
            switch newVaule {
            case 10..<99 :
                countWidth.constant = 24
            case 100..<Int.max :
                countWidth.constant = 26
                unread = "99+"
            default:
                countWidth.constant = 16
            }
            countLabel.setTitle(unread, for: .normal)
            countLabel.isHidden = newVaule < 1
        }
    }
    
    @IBOutlet weak var countWidth: NSLayoutConstraint!
    @IBOutlet weak var countHeight: NSLayoutConstraint!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var briefLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var countLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countLabel.setBackgroundImage(UIImage.image(color: UIColor.red), for: .disabled)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
