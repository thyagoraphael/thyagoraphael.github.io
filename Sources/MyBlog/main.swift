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
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "Thyago Raphael"
    var description = "Compartilhando meus estudos sobre iOS, Swift & muito mais"
    var language: Language { .brPortuguese }
    var imagePath: Path? { "images/developer-team.png" }
}

// This will generate your website using the built-in Foundation theme:
try MyBlog().publish(withTheme: .default(
    additionalStylesheetPaths: ["/apps.css"],
    pagePaths: ["about"], // Quando tiver com seus projetos, adicionar "apps"
    contentPagePaths: ["about"],
    navigationLinks: [
        .init(name: "Linkedin",
              url: "https://www.linkedin.com/in/thyagoraphael/")],
    copyright: "Thyago Raphael",
    twitterURL: "https://twitter.com/thyagoraphael",
    githubURL: "https://github.com/thyagoraphael"
),
    deployedUsing: .gitHub("thyagoraphael/thyagoraphael.github.io", useSSH: false),
    additionalSteps: [.addAppMarkdownFiles()], plugins: [.splash(withClassPrefix: "")]
)


