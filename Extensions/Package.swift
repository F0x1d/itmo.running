// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Extensions",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Extensions",
            targets: ["Extensions"]),
    ],
    targets: [
        .target(name: "Extensions")
    ]
)
