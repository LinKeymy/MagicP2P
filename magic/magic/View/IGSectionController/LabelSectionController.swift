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
import Alamofire

final class LabelSectionController: BaseSectionController {


    override init() {
        super.init()
        supplementaryViewSource = self
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width - 0.1, height: 64)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = collectionContext!.dequeueReusableCell(withNibName: "SelectedPlatCell", bundle: nil, for: self, at: index) as! SelectedPlatCell
        if let assets = data?.list as? [SelectedAssets] {
            nibCell.assets = assets[index]
        }
        return nibCell
    }


    override func didSelectItem(at index: Int) {
        if index == 0 {
            Router.open(WebAPI.assetsDistribute.rawValue)
        } else {
            let plattab = PlatTableController()
            if let assets = data?.list as? [SelectedAssets] {
                plattab.title = assets[index].platCnName
            }
            viewController?.navigationController?.pushViewController(plattab, animated: true)
            //            Router.open("touzhijia://platTable")
        }
    }
}

extension LabelSectionController {
    override func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    override func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                       for: self,
                                                                       nibName: "UserHeaderView",
                                                                       bundle: nil,
                                                                       at: index) as! UserHeaderView
        view.handleLabel.text = "余额"
        view.nameLabel.text = "我的自选"
        view.centerLabel.text = "资产"
        return view
    }
    
    override func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 40)
    }
}



