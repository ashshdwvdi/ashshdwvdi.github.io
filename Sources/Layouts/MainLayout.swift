import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some HTML {
        Body {
            content
            MineSweeper()
            IgniteFooter()
            SocialView(Constants.socialLinks)
        }
    }
}
