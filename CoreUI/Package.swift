// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CoreUI",
            targets: ["CoreUI"]
        ),
    ],
    dependencies: [
        .package(path: "../Extensions")
    ],
    targets: [
        .target(
            name: "CoreUI",
            dependencies: [
                "Extensions"
            ]
        )
    ]
)
