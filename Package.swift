// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "example-docc-project",
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "ExampleDocs",
            // The path structure of "." is to host the relevant DocC catalog at the root of the package.
            // The excludes are cease warnings for the other files in there that it can't figure out
            // what to do with - README.md and LICENSE.
            path: ".",
            // The downside of this structure, especially with hosting other content alongside the DocC catalog,
            // is that SwiftPM complains about any rendered content, for example all the individual files
            // you might host for GitHub pages publishing.
            exclude: ["README.md", "LICENSE", "img/github-pages-config.png"]
        )
    ]
)
