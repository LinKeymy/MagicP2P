/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.

 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

final class HorizontalSectionController: IGListSectionController, IGListSectionType, IGListAdapterDataSource {
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }

    var data: SectionContent?

    lazy var adapter: IGListAdapter = {
        let adapter = IGListAdapter(updater: IGListAdapterUpdater(),
                                    viewController: self.viewController,
                                    workingRangeSize: 0)
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
        return adapter
    }()

    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        
        let width = collectionContext!.containerSize.width
        
        if let dataType = data?.conType {
            if dataType == .platTodayTurnover {
                return CGSize(width: width, height:185 + 10 )
            }
            if dataType == .imageTheme {
                return CGSize(width: width, height: 106)
            }
            
            if dataType == .column {
                if let itemh = data?.itemh {
                    return CGSize(width: width, height: itemh + 20)
                }
                return CGSize(width: width, height: 261)
            }
            
            if dataType == .staticBanner {
                return CGSize(width: width, height: width * 0.7)
            }
            
            if dataType == .tips {
                return CGSize(width: width, height: 80)
            }
        }
        return CGSize(width: width, height: 80)
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
    
        adapter.collectionView = cell.collectionView
        return cell
    }

    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    

    func didSelectItem(at index: Int) {
       
    }

    //MARK: IGListAdapterDataSource
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        if let data = data {
            return [data]
        }
        return [1] as [IGListDiffable]
    }

    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        
        guard let data = data else {
            return EmbeddedSectionController()
        }
        switch data.conType {
        case .imageTheme:
            return ImageThemeSectionController()
        case .column:
            return ColumnSectionController()
        case .staticBanner:
            return StaticBannerSectionController()
        case .tips:
            return  EmbeddedSectionController()
        default:
            return PlatTodayTurnSecitonController()
        }
    }

    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        let l = UILabel()
        l.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        l.text = "没有数据"
        l.textAlignment = .center
        return l
    }
}


extension HorizontalSectionController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if let dataType = data?.conType {
            if dataType != .staticBanner {
                return
            }
        }
         scrollView.decelerationRate = UIScrollViewDecelerationRateFast
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

}


extension HorizontalSectionController:IGListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                       for: self,
                                                                       nibName: "BoldTitleHeader",
                                                                       bundle: nil,
                                                                       at: index) as! BoldTitleHeader
        view.leftLabel.text = data?.title
        view.rightButton.setTitle(data?.rightEntry, for: .normal)
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        var h: CGFloat = 0.01
        if let data = data {
            if data.isShowHeader {
                h = 40
            }
        }
        return CGSize(width: collectionContext!.containerSize.width, height: h)
    }
}


