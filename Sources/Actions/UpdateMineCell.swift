//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 17/03/25.
//

import Foundation
import Ignite

public struct UpdateMineCell: Action {
    /// The unique identifier of the element of the modal we're trying to dismiss.
    var id: String
    var cell: Game.CellState
    
    /// Creates a new DismissModal action from a specific page element ID.
    /// - Parameter id: The unique identifier of the element of the modal we're trying to dismiss.
    public init(id: String, for cell: Game.CellState) {
        self.id = id
        self.cell = cell
    }

    /// Renders this action using publishing context passed in.
    /// - Returns: The JavaScript for this action.
    public func compile() -> String {
        var text = "🪨"
        switch cell {
        case .neighbours(let points):
            if points == .zero {
                text = "🪨"
            } else {
                text = String(format: "%02d", points)
            }
        case .cactus:
            text = "🌵"
        default:
            break
        }
        
        return """
        let button = document.getElementById('\(id)');
        button.innerText = '\(text)';
        button.style.backgroundColor = 'grey' 
        """
    }
}
