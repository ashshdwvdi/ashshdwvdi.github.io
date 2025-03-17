//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 17/03/25.
//

import Foundation
import Ignite

final class MineSweeper: HTML {
    static let rows = 9
    static let cols = 9
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
            ForEach(0..<Self.rows) { row in
                Text {
                    ForEach(0..<Self.cols) { col in
                        Button {
                            Text(String(format: "%02d", 0))
                                .font(.title6)
                                .foregroundStyle(.clear)
                        } actions: {
                            UpdateMineCell(id: "\(row)\(col)")
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
