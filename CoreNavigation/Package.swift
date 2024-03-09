// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CoreNavigation",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CoreNavigation",
            targets: ["CoreNavigation"]),
    ],
    targets: [
        .target(
            name: "CoreNavigation"),
        .testTarget(
            name: "CoreNavigationTests",
            dependencies: ["CoreNavigation"]),
    ]
)
