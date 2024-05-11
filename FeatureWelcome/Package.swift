// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FeatureWelcome",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "FeatureWelcome",
            targets: ["FeatureWelcome"]
        )
    ],
    dependencies: [
        .package(path: "../CoreNavigation"),
        .package(path: "../CoreUI"),
        .package(path: "../CoreArch"),
        .package(path: "../CoreDI"),
        .package(path: "../Extensions"),
        .package(path: "../FeatureLocationApi"),
        .package(url: "https://github.com/sparrowcode/AlertKit.git", from: "5.1.8"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/malcommac/SwiftLocation.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "FeatureWelcome",
            dependencies: [
                "CoreNavigation",
                "CoreUI",
                "CoreArch",
                "CoreDI",
                "Extensions",
                "FeatureLocationApi",
                "AlertKit",
                "Factory",
                "SwiftLocation"
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
