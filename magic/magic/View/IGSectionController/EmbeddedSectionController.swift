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

class EmbeddedSectionController: IGListSectionController, IGListSectionType{
    
    
    func sizeForItem(at index: Int) -> CGSize {
        let containrWidth = collectionContext?.containerSize.width ?? 0
        let width = (containrWidth - 10) / 4
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: width, height: height - 1)
    }
    
    
    var data: SectionContent?
    
    func didUpdate(to object: Any) {
        data = object as? SectionContent
    }
    
    func didSelectItem(at index: Int) {
        if let ite = data?.list as? [GridItem],
            let str = ite[index].uri{
            Router.open(str)
        }
    }
    
    func numberOfItems() -> Int {
        return data?.list.count ?? 0
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as! CenterLabelCell
        if let user = data?.list as? [GridItem] {
            cell.embedded.label.text = user[index].title
            if let name = user[index].icon {
                cell.icon = UIImage(named: name)
            }
            cell.embedded.sizeToFit()
        }
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
}


