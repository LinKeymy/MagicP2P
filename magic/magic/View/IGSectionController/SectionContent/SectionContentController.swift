//
//  SectionContentController.swift
//  magic
//
//  Created by SteveLin on 2017/6/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class SectionContentController: BaseAnchorVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    var data:[SectionContent] = [SectionContent(id: Int.max, title: "", list: [], isShowHeader: false, cocontenType: "bids", rightEntry: nil)]
}


extension SectionContentController: IGListAdapterDataSource {
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        print("objectobject:\(object)")
        
        guard let object = object as? SectionContent else {
            return HorizontalMenuSectionController()
        }
        
        print("object.list:\(object.list.count)")
        return object.conType.sectionContrlloer
      
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
    
}
