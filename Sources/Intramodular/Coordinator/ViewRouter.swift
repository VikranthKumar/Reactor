//
// Copyright (c) Vatsal Manot
//

import Merge
import Foundation
import SwiftUIX

public enum ViewRouterError: Error {
    case transitionError(ViewTransition.Error)
    case unknown
}

public protocol ViewRouter: Presentable {
    associatedtype Route: ViewRoute
    
    func triggerPublisher(for _: Route) -> AnyPublisher<ViewTransitionContext, ViewRouterError>

    @discardableResult
    func trigger(_: Route) -> AnyPublisher<ViewTransitionContext, ViewRouterError>
}
