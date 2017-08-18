//
//  MarketViewController.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

private let kTitleViewH :CGFloat = 40

class MarketViewController: BaseViewController {
    
    let titles = ["推荐","标的","平台","商场"]
    var childVcs: [UIViewController]?
    
    
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: -8, y: 0, width: kScreenW, height: kTitleViewH)
        let titleView = PageTitleView(frame: titleFrame, titles: (self?.titles)!)
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate var navtitleView: UIView = {
            let v = UIView(frame:  CGRect(x: 0, y: 4, width: kScreenW, height: kTitleViewH))
        return v
    }()
    
    fileprivate lazy var pageContentView: PageContentView = { [weak self] in
        let contentFrame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kNavBarH - kTabBarH)
        var childVcs = [UIViewController]()
        childVcs.append(RecommendController())
        childVcs.append(BidController())
        childVcs.append(PlatController())
        childVcs.append(CategoryController())
        self?.childVcs = childVcs
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        contentView.delegate = self
        return contentView
        }()
    
    private func setupNavgationBar() {
        //此句可以隐藏导航栏底部线条
        //self.navigationController?.navigationBar.clipsToBounds = true;
        navtitleView.addSubview(pageTitleView)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.titleView = navtitleView
    }
    
    func rightItemClicked() {
        deLog("rightItemClicked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavgationBar()
        view.addSubview(pageContentView)
    }
    
    
}


//MARK:- PageTitleViewDelegate代理实现
extension MarketViewController : PageTitleViewDelegate{
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
        childVcs?[index].viewDidAppear(false)
        print("titleIndex\(index)")
    }
}

//MARK:- PageContentViewDelegate代理实现
extension MarketViewController : PageContentViewDelegate{
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        print("progress:\(progress),sourceIndex:\(sourceIndex),targetIndex:\(targetIndex)")
    }
}
