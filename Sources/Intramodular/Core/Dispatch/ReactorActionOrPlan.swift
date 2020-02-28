//
// Copyright (c) Vatsal Manot
//

import Merge
import SwiftUIX
import Task

public enum ReactorActionOrPlan<R: Reactor> {
    case action(R.Action)
    case plan(R.Plan)
    
    public func createTaskName() -> TaskName {
        switch self {
            case .action(let action):
                return action.createTaskName()
            case .plan(let plan):
                return plan.createTaskName()
        }
    }
}