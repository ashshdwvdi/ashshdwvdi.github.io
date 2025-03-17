//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 17/03/25.
//

import Foundation
import Ignite

final class MineSweeper: HTML {
    static let rows = 10
    static let cols = 10
    var body: some HTML {
        Text {
            "🏜️ Desert Safari 🏜️"
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
                        Button(
                            Text("\(col)")
                                .font(.title6)
                                .foregroundStyle(.white)
                        )
                        .role(.none)
                        .type(.plain)
                        .buttonSize(.large)
                        .background((col + row) % 2 == 0 ? .sandyBrown : .saddleBrown)
                    }
                }
                .horizontalAlignment(.center)
            }
        }
        .animation(.wiggle, on: .appear)
    }
}
