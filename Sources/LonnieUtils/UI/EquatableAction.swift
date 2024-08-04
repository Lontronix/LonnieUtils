//
//  EquatableAction.swift
//
//
//  Created by Lonnie Gerol on 7/27/24.
//

import Foundation

public struct EquatableAction<ActionArgument, ActionReturn, ActionID: Equatable> : Equatable {

    let id: ActionID
    let action: (ActionArgument) -> ActionReturn

    public init(id: ActionID, action: @escaping (ActionArgument) -> ActionReturn) {
        self.id = id
        self.action = action
    }

    func callAsFunction(_ argument: ActionArgument) -> ActionReturn {
        return action(argument)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

}

public extension EquatableAction where ActionArgument == Void {

    func callAsFunction(_ argument: Void = ()) -> ActionReturn {
        return action(argument)
    }

}
