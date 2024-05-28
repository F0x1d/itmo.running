// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FeatureTrack",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "FeatureTrack",
            targets: ["FeatureTrack"]
        )
    ],
    dependencies: [
        .package(path: "../Data"),
        .package(path: "../CoreNavigation"),
        .package(path: "../CoreUI"),
        .package(path: "../CoreArch"),
        .package(path: "../CoreDI"),
        .package(path: "../Extensions"),
        .package(url: "https://github.com/sparrowcode/AlertKit.git", from: "5.1.8"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/malcommac/SwiftLocation.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "FeatureTrack",
            dependencies: [
                "Data",
                "CoreNavigation",
                "CoreUI",
                "CoreArch",
                "CoreDI",
                "Extensions",
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
