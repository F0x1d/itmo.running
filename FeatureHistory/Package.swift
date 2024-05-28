// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FeatureHistory",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "FeatureHistory",
            targets: ["FeatureHistory"]
        )
    ],
    dependencies: [
        .package(path: "../Data"),
        .package(path: "../CoreUI"),
        .package(path: "../CoreNavigation"),
        .package(path: "../Extensions"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/malcommac/SwiftLocation.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "FeatureHistory",
            dependencies: [
                "Data",
                "CoreUI",
                "CoreNavigation",
                "Extensions",
                "Factory",
                "SwiftLocation"
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
