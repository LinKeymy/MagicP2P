//
//  EmbeddedItemView.swift
//  magic
//
//  Created by SteveLin on 2017/4/25.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import SnapKit

class EmbeddedItemView: UIView {
    
    var isHideLine:Bool {
        set(newValue) {
            leftLine.isHidden = newValue
            bottomLine.isHidden = newValue
        }
        get {
            return leftLine.isHidden && bottomLine.isHidden
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        topBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY)
        }
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.centerY).offset(5)
        }
        
        leftLine.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(0.3).priority(.high)
        }
        
        bottomLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.3).priority(.high)
        }
        rightLine.snp.makeConstraints { (make) in
            make.bottom.top.right.equalToSuperview()
            make.width.equalTo(leftLine)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.textColor = THexColor("6e6e6e")
        view.font = .systemFont(ofSize: 14)
        self.addSubview(view)
        return view
    }()
    
    lazy var leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = Background.table
        self.addSubview(view)
        view.isHidden = true
        return view
    }()
    
    lazy var rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.addSubview(view)
        view.isHidden = true
        return view
    }()
    
    lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = Background.table
        view.isHidden = true
        self.addSubview(view)
        return view
    }()
    
    lazy var topBtn:UIButton = {
        let view = UIButton()
        view.setTitleColor(Gray.medium, for: .disabled)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.isEnabled = false
        self.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
