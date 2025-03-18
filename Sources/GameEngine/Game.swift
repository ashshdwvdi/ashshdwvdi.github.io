//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 18/03/25.
//

import Foundation

public struct Game {
    public var solvedState: [[CellState]] = []
}

extension Game {
    public enum CellState: Equatable {
        case revealed
        case empty
        case neighbours(_ count: Int)
        case cactus
    }
}
