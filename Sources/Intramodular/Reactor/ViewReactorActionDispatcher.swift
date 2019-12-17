//
// Copyright (c) Vatsal Manot
//

import Merge
import SwiftUIX

public struct ViewReactorActionDispatcher<R: ViewReactor> {
    public typealias Output = Void
    public typealias Failure = Never
    
    public let reactor: R
    public let action: R.Action
    
    public var cancellables: Cancellables {
        return reactor.cancellables
    }
    
    public func reduce(event: R.Event) {
        DispatchQueue.main.async {
            self.reactor.reduce(event: event)
        }
    }
    
    public func dispatch() -> Task<Void, Error> {
        let _cancellable = SingleAssignmentCancellable()
        let cancellable = AnyCancellable(_cancellable)
        
        cancellables.insert(cancellable)
        
        let subscriber = ViewReactorTaskSubscriber<R>(
            receiveEvent: reduce(event:),
            receiveCompletion: { [weak cancellables] completion in
                cancellables?.remove(cancellable)
                
                switch completion {
                    case .finished:
                        break
                    case .failure(_):
                        fatalError()
                }
            }
        )
        
        reactor
            .task(action: action)
            .receive(subscriber: subscriber)
        
        return subscriber.subscription
    }
}