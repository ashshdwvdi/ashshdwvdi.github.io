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
    var name = Constants.name
    var titleSuffix = Constants.titleSuffix
    var url = Constants.url
    var builtInIconsEnabled = true
    var author = Constants.author

    var homePage = Home()
    var layout = MainLayout()
}
