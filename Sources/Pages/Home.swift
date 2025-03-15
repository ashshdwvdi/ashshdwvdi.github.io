import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        NavigationBar(logo: "@ashshdwvdi") {
            Link("Resume 📑", target: URL(static: "/resume.pdf"))
        }
        .navigationBarStyle(.light)
    }
}

