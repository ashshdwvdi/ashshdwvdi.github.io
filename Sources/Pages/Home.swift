import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        NavigationBar(logo: "@ashshdwvdi") {
            Link("Resume 📑", target: URL(static: Constants.resumeLink))
            Link("Github", target: URL(static: Constants.githubLink))
            Link("Linkedin", target: URL(static: Constants.linkedin))
        }
        .navigationBarStyle(.light)
    }
}

