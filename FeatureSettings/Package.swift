// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FeatureSettings",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "FeatureSettings",
            targets: ["FeatureSettings"]
        )
    ],
    dependencies: [
        .package(path: "../Extensions")
    ],
    targets: [
        .target(
            name: "FeatureSettings",
            dependencies: [
                "Extensions"
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
