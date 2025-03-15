import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = HelloSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct HelloSite: Site {    
    var name = "Hello!"
    var titleSuffix = "My Awesome Introduction"
    var url = URL(static: "https://ashshdwvdi.github.io")
    var builtInIconsEnabled = true

    var author = "Ashish Dwivedi"

    var homePage = Home()
    var layout = MainLayout()
}
