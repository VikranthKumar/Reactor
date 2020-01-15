//
// Copyright (c) Vatsal Manot
//

import Merge
import SwiftUIX

public struct ViewReactorEnvironmentInjector: ViewModifier {
    public let environment: () -> ViewReactorEnvironment
    
    public func body(content: Content) -> some View {
        content
            .environmentObject(environment().taskPipeline)
    }
}

// MARK: - API -

extension View {
    public func injectReactorEnvironment(
        _ environment: @autoclosure @escaping () -> ViewReactorEnvironment
    ) -> some View {
        modifier(ViewReactorEnvironmentInjector(environment: environment))
    }
}