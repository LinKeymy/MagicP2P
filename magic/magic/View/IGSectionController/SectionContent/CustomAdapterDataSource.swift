//
//  CustomAdapterDataSource.swift
//  magic
//
//  Created by SteveLin on 2017/6/26.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

protocol CustomAdapterDataSource: IGListAdapterDataSource {
    var data:[SectionContent] { get }

}


// 可惜了，OC 中的协议无法添加扩展，只能通过继承来实现了
//extension CustomAdapterDataSource {
//
//    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
//        return data
//    }
//    
//    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
//        print("objectobject:\(object)")
//        
//        guard let object = object as? SectionContent else {
//            return HorizontalMenuSectionController()
//        }
//        
//        print("object.list:\(object.list.count)")
//        
//        switch object.conType {
//        case .bid:
//            return BidCellSectionController()
//        case .autoPlayBanner:
//            return CircleSectionController()
//        case .platTodayTurnover, .imageTheme:
//            return HorizontalSectionController()
//        case .grid:
//            return GridSectionController()
//        case .platBaseInfo:
//            return PlatformBaseSectionController()
//        case .column:
//            return HorizontalSectionController()
//        case .focalcontent:
//            return FocalcontentSectionController()
//        case .breakingEvent:
//            return BreakingEventSectionController()
//        default:
//            return BidCellSectionController()
//        }
//    }
//    
//    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
//        return nil
//    }
//
//}
