//
//  HorizontalMenuSectionController.swift
//  magic
//
//  Created by SteveLin on 2017/5/9.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit
class HorizontalMenuSectionController: IGListSectionController,IGListAdapterDataSource,IGListSectionType {
    var number: Int?
    
    lazy var adapter: IGListAdapter = {
        let adapter = IGListAdapter(updater: IGListAdapterUpdater(),
                                    viewController: self.viewController,
                                    workingRangeSize: 0)
        adapter.dataSource = self
        return adapter
    }()
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 120)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    func didUpdate(to object: Any) {
        number = 6
    }
    
    func didSelectItem(at index: Int) {}
    
    //MARK: IGListAdapterDataSource
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        guard let number = number else { return [] }
        return (0..<number).map { $0 as IGListDiffable }
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return EmbeddedMenuSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}
