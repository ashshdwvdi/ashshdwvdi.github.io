//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 18/03/25.
//

import Foundation

public final class GameEngine {
    /// This returns a game state object based on players specific moves.
    public func start() -> Game {
        let rows = 9
        let cols = 9
        let numberOfCactus = 10
        return Game(solvedState: Self.build(rows, cols, numberOfCactus))
    }
}
