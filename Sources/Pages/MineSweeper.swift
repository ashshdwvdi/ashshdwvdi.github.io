//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 17/03/25.
//

import Foundation
import Ignite

final class MineSweeper: HTML {
    private let game = GameEngine().start()
    
    var body: some HTML {
        Text {
            "🏜️ Cactus Sweeper 🏜️"
        }
        .horizontalAlignment(.center)
        .margin(.top, .xLarge)
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.sandyBrown)
        .padding(.bottom)
        
        VStack(spacing: 0) {
            ForEach(0..<self.game.solvedState.count) { row in
                Text {
                    ForEach(0..<self.game.solvedState[0].count) { col in
                        Button {
                            Text("🪨")
                                .font(.title6)
                                .foregroundStyle(.clear)
                        } actions: {
                            UpdateMineCell(id: "\(row)\(col)", for: self.game.solvedState[row][col])
                        }
                        .role(.none)
                        .type(.plain)
                        .buttonSize(.large)
                        .background((col + row) % 2 == 0 ? .sandyBrown : .saddleBrown)
                        .id("\(row)\(col)")
                    }
                }
                .horizontalAlignment(.center)
            }
        }
        .animation(.wiggle, on: .appear)
    }
}
