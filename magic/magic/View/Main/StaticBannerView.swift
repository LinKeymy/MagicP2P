//
//  StaticBanneriew.swift
//  magic
//
//  Created by SteveLin on 2017/6/29.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit


fileprivate let StaticBannerCellID = "StaticBannerCellID"

enum FlowDirection {
    case left
    case right
}

protocol StaticBannerViewDelegate:NSObjectProtocol {
    func didSelected(staticBannerView:StaticBannerView,index:Int)
}

class StaticBannerView: UIView {
    var direction:FlowDirection = .right
    var contentWidth: CGFloat = 0
    var itemLength: CGFloat = 0
    var starPoint: CGPoint = .zero
    var endPoint: CGPoint = .zero
    var velocity: CGPoint = .zero
    var targetPoint: CGPoint = .zero
    var pageLength:CGFloat = 0
    weak var delegate:StaticBannerViewDelegate?
    var items:[GridItem]? {
        didSet {
            self.collectionV.reloadData()
        }
    }

    lazy  var collectionV: UICollectionView =  {
        let co = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        co.decelerationRate = UIScrollViewDecelerationRateFast
        co.backgroundColor = UIColor.white
        co.showsHorizontalScrollIndicator = false
        return co
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionV)
        collectionV.dataSource = self
        collectionV.delegate = self
        collectionV.register(UINib(nibName: "StaticBannerCell", bundle: nil), forCellWithReuseIdentifier: StaticBannerCellID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionV.frame = bounds
        let layout = collectionV.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: kScreenW - 40, height: bounds.height - 20)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension StaticBannerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (items?.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StaticBannerCellID, for: indexPath) as! StaticBannerCell
        if let items = items {
            cell.item = items[indexPath.item % items.count]
        }
        return cell
    }
}

extension StaticBannerView: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
        let pageLength = kScreenW - 30
        //truncatingRemainder 浮点数取余操作
        if abs(velocity.x) > 0.5 || scrollView.contentOffset.x.truncatingRemainder(dividingBy: pageLength) >= pageLength/2 {
            
            targetContentOffset.deinitialize()
            
            var index = scrollView.contentOffset.x / pageLength + 1
            
            if velocity.x < 0 {
                index = scrollView.contentOffset.x / pageLength
            }
            print("index:\(floor(index))")
            targetContentOffset.pointee = CGPoint(x:floor(index) * pageLength, y:0)
            print("velocity:\(velocity)")
        } else {
            print("deinitialize:\(velocity)")
            targetContentOffset.deinitialize()
            targetContentOffset.pointee = CGPoint(x:floor(scrollView.contentOffset.x / pageLength) * pageLength, y:0)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelected(staticBannerView: self, index: indexPath.item)
    }


}


