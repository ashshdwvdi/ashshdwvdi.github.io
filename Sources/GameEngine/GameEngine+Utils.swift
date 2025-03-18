//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 18/03/25.
//

import Foundation

extension GameEngine {
    public struct BoardCell: Equatable, Hashable {
        public var row: Int
        public var col: Int
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.row == rhs.row && lhs.col == rhs.col
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(row)
            hasher.combine(col)
        }
    }
    
    /// This returns a new board after calculating cactus, neighbours and empty cells on the board.
    public static func build(_ rows: Int, _ cols: Int, _ numberOfCactus: Int) -> [[Game.CellState]] {
        var temp: [[BoardCell]] = []
        for row in 0..<rows {
            var temp2: [BoardCell] = []
            for col in 0..<cols {
                temp2.append(BoardCell(row: row, col: col))
            }
            temp.append(temp2)
        }
        
        var cactuses: Set<BoardCell> = []
        
        for _ in 0..<numberOfCactus {
            let choice = temp.randomElement()
            if let option = choice?.randomElement() {
                cactuses.insert(option)
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
    
    public static func didPlaceCactuses(_ cactuses: Set<BoardCell>, on board: inout [[Game.CellState]]) {
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
    
    public static func didPlaceNeighbours(for cactuses: Set<BoardCell>, on board: inout [[Game.CellState]]) {
        let rows = board.count
        let cols = board[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if !cactuses.contains(.init(row: row, col: col)) {
                    board[row][col] = Game.CellState.neighbours(
                        totalNeighbours(
                            for: BoardCell(row: row, col: col),
                            cactuses,
                            totalRows: rows,
                            totalCols: cols
                        )
                    )
                }
            }
        }
    }
    
    public static func totalNeighbours(
        for cellAtIndex: BoardCell,
        _ cactuses: Set<BoardCell>,
        totalRows: Int,
        totalCols: Int
    ) -> Int {
        var total = 0
        
        for i in -1...1 {
            for j in -1...1 {
                if i == 0 && j == 0 { continue } // Skip the current cell
                
                let xOff = cellAtIndex.row + i
                let yOff = cellAtIndex.col + j
                
                if isValid(xOff, yOff, totalRows, totalCols),
                   cactuses.contains(.init(row: xOff, col: yOff)) {
                    total += 1
                }
            }
        }
        return total
    }
    
    private static func isValid(_ xOff: Int, _ yOff: Int, _ rows: Int, _ cols: Int) -> Bool {
        return xOff >= 0 && xOff < rows && yOff >= 0 && yOff < cols
    }
}
