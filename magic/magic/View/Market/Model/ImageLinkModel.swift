//
//  ImageLinkModel.swift
//  magic
//
//  Created by SteveLin on 2017/5/8.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import IGListKit

class ImageLinkModel: NSObject {
    //图片链接
    var image_url:String?
    //点击图片跳转链接
    var link_url:String?
    
    override var description: String {
        return yy_modelDescription()
    }
}

extension ImageLinkModel:IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ImageLinkModel else { return false }
        return self.image_url == object.image_url && self.link_url == object.link_url
    }
}


