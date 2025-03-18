//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 18/03/25.
//

import Foundation

struct Game {
    enum CellState: Equatable {
        case revealed
        case empty
        case neighbours(_ count: Int)
        case cactus
    }
    
    var board: [[CellState]] = []
    var solvedState: [[CellState]] = []
}

final class GameEngine {
    
    struct BoardCell: Equatable, Hashable {
        var row: Int
        var col: Int
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.row == rhs.row && lhs.col == rhs.col
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(row)
            hasher.combine(col)
        }
    }
    
    private static let numberofCactus = 10
    /// This returns a game state object based on players specific moves.
    func start() -> Game {
        let rows = 9
        let cols = 9
        
        let board = Array(
            repeating: Array(repeating: Game.CellState.empty, count: cols),
            count: rows
        )
        
        return Game(board: board, solvedState: Self.build(rows, cols))
    }
    
    /// This returns a new board after calculating cactus, neighbours and empty cells on the board.
    private static func build(_ rows: Int, _ cols: Int) -> [[Game.CellState]] {
        var temp: [[BoardCell]] = []
        for row in 0..<rows {
            var temp2: [BoardCell] = []
            for col in 0..<cols {
                temp2.append(BoardCell(row: row, col: col))
            }
            temp.append(temp2)
        }
        
        var cactuses: Set<BoardCell> = []
        
        for _ in 0..<numberofCactus {
            var choice = temp.randomElement()
            if let option = choice?.randomElement() {
                cactuses.insert(option)
                choice?.remove(at: option.col)
                temp[option.row] = choice ?? []
            }
        }
        
        var res: [[Game.CellState]] = Array(
            repeating: Array(repeating: Game.CellState.empty, count: cols),
            count: rows
        )
        
        /// Place cactuses on a temporary board.
        didPlaceCactuses(cactuses, on: &res)
        
        /// Place neighbours on the board.
        didPlaceNeighbours(for: cactuses, on: &res)
        
        return res
    }
    
    private static func didPlaceCactuses(_ cactuses: Set<BoardCell>, on board: inout [[Game.CellState]]) {
        let rows = board.count
        let cols = board[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if cactuses.contains(.init(row: row, col: col)) {
                    board[row][col] = Game.CellState.cactus
                }
            }
        }
    }
    
    private static func didPlaceNeighbours(for cactuses: Set<BoardCell>, on board: inout [[Game.CellState]]) {
        let rows = board.count
        let cols = board[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        for row in 0..<rows {
            for col in 0..<cols {
                if !visited[row][col], !cactuses.contains(.init(row: row, col: col)) {
                    board[row][col] = Game.CellState.neighbours(
                        totalNeighbours(for: BoardCell(row: row, col: col), &visited)
                    )
                }
            }
        }
    }
    
    private static func totalNeighbours(for cellAtIndex: BoardCell, _ visited: inout [[Bool]]) -> Int {
        return 0
    }
}
