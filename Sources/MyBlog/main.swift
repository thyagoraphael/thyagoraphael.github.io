import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct MyBlog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        // New Sections
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "Thyago Raphael"
    var description = "iOS Developer & Swift Blog "
    var language: Language { .brPortuguese }
    var imagePath: Path? { "images/developer-team.png" }
}

// This will generate your website using the built-in Foundation theme:
try MyBlog().publish(withTheme: .default(
    additionalStylesheetPaths: ["/apps.css"],
    pagePaths: ["apps", "about"],
    contentPagePaths: ["about"],
    navigationLinks: [
        .init(name: "Résumé",
              url: "https://s3.amazonaws.com/niazoff.com/resume.pdf")],
    copyright: "Thyago Raphael",
    twitterURL: "https://twitter.com/thyagoraphael",
    githubURL: "https://github.com/thyagoraphael"
),
    deployedUsing: .gitHub("thyagoraphael/thyagoraphael.github.io", useSSH: false),
    additionalSteps: [.addAppMarkdownFiles()], plugins: [.splash(withClassPrefix: "")]
)


