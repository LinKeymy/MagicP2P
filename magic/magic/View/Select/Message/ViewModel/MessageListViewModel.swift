//
//  MessageViewModel.swift
//  magic
//
//  Created by SteveLin on 2017/6/1.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Moya
import RxSwift


class SourcesViewModel:TableSourceType {
    internal var sourcesble = Variable<[MessageSource]>([])
    
    func fectchMessageSources() -> Observable<[MessageSource]> {
        return Network.request(MessageAPI.messages).mapModels(type: MessageSource.self, listKey: "list")
    }
    
    func updateMessageSources() {
        _ = Network.request(MessageAPI.messages).mapModels(type: MessageSource.self, listKey: "list").subscribe(
            onNext: {
                [weak self]  in
                self?.sourcesble.value = $0
        })
    }
    
}

class MessageListViewModel: TableSourceType {
    var sourcesble = Variable<[MessageViewModel]>([])
    var sources: [MessageViewModel] {
        return sourcesble.value.reversed()
    }
    var sections: [[MessageViewModel]] {
        return sourcesble.value.reversed().divideMap{ return $0.dayString == $1.dayString }
    }
    
    var id:String
    init(id:String) {
        self.id = id
    }
    func fetchMessage() {
        if let index = sourcesble.value.last?.id {
            _ = fectchMessage(id: id, startIndex: index).subscribe(onNext: {  [weak self] in
                let viewModels = $0.map { return MessageViewModel(message: $0 ) }
                self?.sourcesble.value.append(contentsOf: viewModels)
                print("fetchMessge:\($0.count)")
            })
        }
    }
    
    func fectchMessage(id:String, startIndex:Int) -> Observable<[Message]> {
        return Network.request(MessageAPI.detail(id: id, start: startIndex, limit: 5)).mapModels(type: Message.self, listKey: "list")
    }
}
