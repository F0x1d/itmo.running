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
    targets: [
        .target(
            name: "FeatureHistory"
        )
    ]
)
