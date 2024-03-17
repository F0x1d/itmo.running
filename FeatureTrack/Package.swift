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
    targets: [
        .target(
            name: "FeatureTrack"
        )
    ]
)
