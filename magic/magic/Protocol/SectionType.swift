//
//  SectionType.swift
//  magic
//
//  Created by SteveLin on 2017/7/27.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import Foundation
import IGListKit


protocol sectionType {
    var type:AnyClass { get }
    var conType:ContentType { get }
}

enum ContentType:String {
    
    case autoPlayBanner = "autoPlayBanner"
    case staticBanner   = "staticBanner"
    case activity       = "activity"
    case bid            = "bids"
    case platTodayTurnover = "platTodayTurnover"
    case grid = "grid"
    case imageTheme = "imageTheme"
    case platBaseInfo = "platBaseInfo"
    case column = "column"
    case focalcontent = "focalcontent"
    case breakingEvent = "breakingEvent"
    case justText = "justText"
    case platAssets = "platAssets"
    case selectedAssets = "selectedAssets"
    case tips = "tips"
    
    var type: NSObject.Type {
        switch self {
        case .autoPlayBanner:
            return ImageLinkModel.self
        case .bid:
            return Bid.self
        case .platTodayTurnover:
            return PlatTodayTurnover.self
        case .column:
            return GridItem.self
        case .platBaseInfo:
            return PlatBaseInfo.self
        case .focalcontent, .breakingEvent, .justText, .grid, .imageTheme,.staticBanner, .tips:
            return GridItem.self
        case .platAssets:
            return SelectedAssets.self
        case .selectedAssets:
            return SelectedAssets.self
        default:
            return Bid.self
        }
    }
    
    var sectionContrlloer: IGListSectionController {
        switch self {
        case .bid:
            return BidCellSectionController()
        case .autoPlayBanner:
            return CircleSectionController()
        case .platTodayTurnover, .imageTheme, .column, .staticBanner, .tips:
            return HorizontalSectionController()
        case .grid:
            return GridSectionController()
        case .platBaseInfo:
            return PlatformBaseSectionController()
        case .focalcontent:
            return FocalcontentSectionController()
        case .breakingEvent:
            return BreakingEventSectionController()
        case .justText:
            return JustTextSectionController()
        case .platAssets:
            return PlatAssetsSectionController()
        case .selectedAssets:
            return LabelSectionController()
        default:
            return BidCellSectionController()
        }
    }
}
