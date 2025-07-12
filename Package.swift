// swift-tools-version: 6.2

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
            exclude: ["README.md", "LICENSE"],
        ),
    ]
)
