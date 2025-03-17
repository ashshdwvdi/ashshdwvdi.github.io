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

    /// Creates a new DismissModal action from a specific page element ID.
    /// - Parameter id: The unique identifier of the element of the modal we're trying to dismiss.
    public init(id: String) {
        self.id = id
    }

    /// Renders this action using publishing context passed in.
    /// - Returns: The JavaScript for this action.
    public func compile() -> String {
        let points = String(format: "%02d", 1)
        return """
        let button = document.getElementById('\(id)');
        button.innerText = '\(points)';
        button.style.backgroundColor = 'grey' 
        """
    }
}
