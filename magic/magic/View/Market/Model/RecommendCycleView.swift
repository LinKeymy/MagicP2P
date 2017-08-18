//
//  RecommendCycleView.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//
import UIKit

private let CycleCellID = "CollectionCycleCell"

class RecommendCycleView: UIView {

    
    @IBOutlet weak var collectionV: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!

    var cycleTimer : Timer?
    var cycleModels : [ImageLinkModel]? {
        didSet {
            collectionV.reloadData()
            pageControl.numberOfPages = cycleModels?.count ?? 0
//            let indexPath = IndexPath(item: (cycleModels?.count ?? 0) * 100, section: 0)
//            collectionV.scrollToItem(at: indexPath, at: .left, animated: false)
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageControl.isHidden = true
        autoresizingMask = UIViewAutoresizing()
        collectionV.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: CycleCellID)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init(coder:) has been implemented")
//        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionV.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionV.bounds.size//awakeFromNib中拿到collectionView.bounds.size是原来的xib大小，layoutSubviews拿到是大小是指定大小
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionV.isPagingEnabled = true
        collectionV.showsHorizontalScrollIndicator = false
    }
}

extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

extension RecommendCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CycleCellID, for: indexPath) as! CollectionCycleCell
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        return cell
    }
}

extension RecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

extension RecommendCycleView {
    fileprivate func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    fileprivate func removeCycleTimer() {
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    @objc fileprivate func scrollToNext() {
        collectionV.setContentOffset(CGPoint(x: collectionV.contentOffset.x + collectionV.bounds.width, y: 0), animated: true)
    }
}
