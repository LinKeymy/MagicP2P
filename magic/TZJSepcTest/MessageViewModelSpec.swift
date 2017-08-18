//
//  MessageViewModelSpec.swift
//  magic
//
//  Created by SteveLin on 2017/6/5.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import Quick
import Nimble
import RxSwift

@testable
import magic


class MessageViewModelSpec: QuickSpec {
    
    override func spec() {
        var bag:DisposeBag!
        var subject: MessageViewModel!
        beforeEach {
            subject = MessageViewModel()
            bag = DisposeBag()
        }
        afterEach {
            subject = nil
            bag = nil
        }
        
        it("update message source") {
            waitUntil { done in
                subject.updatedSources.take(1).subscribe(onCompleted: {
                    done()
                }).addDisposableTo(bag)
                subject.updateMessageSources()
            }
            expect(subject.numberOfSources) == 3
        }
    }
}
