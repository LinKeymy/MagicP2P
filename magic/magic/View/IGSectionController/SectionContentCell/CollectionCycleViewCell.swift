//
//  CollectionCycleViewCell.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class CollectionCycleViewCell: UICollectionViewCell {
    
    lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        //在collection上添加额外的视图用-
//        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH+kGameViewH), width: kScreenW, height: kCycleViewH)//指定大小
        return cycleView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(cycleView)
        cycleView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
    }

}
