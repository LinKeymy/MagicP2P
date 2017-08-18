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

class CenterLabelCell: UICollectionViewCell {
    
    var title: String? {
        didSet {
            embedded.topBtn.setTitle(title, for: .disabled)
        }
    }
    
    var detailText: String? {
        didSet {
           embedded.label.text = detailText
        }
    }
    
    var icon:UIImage? {
        didSet {
           embedded.topBtn.setImage(icon, for: .disabled)
        }
    }
    
    lazy var embedded: EmbeddedItemView = {
        let view = EmbeddedItemView()
        self.contentView.addSubview(view)
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        embedded.frame = contentView.bounds
    }

}
