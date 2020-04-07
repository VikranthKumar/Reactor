//
// Copyright (c) Vatsal Manot
//

import SwiftUIX

public enum EmptyViewRoute: ViewRoute {
    public typealias Router = EmptyViewRouter
}

public class EmptyViewRouter: ViewRouter {
    public typealias Route = EmptyViewRoute
    
    public var environmentBuilder = EnvironmentBuilder()
    
    public var name: ViewName? {
        nil
    }
    
    public var presenter: DynamicViewPresenter? {
        nil
    }
    
    public func triggerPublisher(for _: Route) -> AnyPublisher<ViewTransitionContext, ViewRouterError> {
        
    }
    
    public func trigger(_ : Route) -> AnyPublisher<ViewTransitionContext, ViewRouterError> {
        
    }
}
