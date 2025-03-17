//
//  File.swift
//  IgniteStarter
//
//  Created by Ashish Dwivedi on 17/03/25.
//

import Foundation
import Ignite

struct SocialLink {
    var url: StaticString
    var icon: StaticString
}

struct SocialView: HTML {
    private var socials: [SocialLink] = []
    
    init(_ socials: [SocialLink]) {
        self.socials = socials
    }
    
    var body: some HTML {
        Text {
            ForEach(socials) { handle in
                makeSocialLink(handle.url, with: handle.icon.description)
                    .margin(.trailing, .medium)
            }
        }
        .horizontalAlignment(.center)
    }
    
    private func makeSocialLink(_ url: StaticString, with icon: String) -> some InlineElement {
        Link(target: url.description) {
            Image(icon, description: icon.description)
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}
