// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CoreArch",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CoreArch",
            targets: ["CoreArch"]
        ),
    ],
    targets: [
        .target(name: "CoreArch")
    ]
)
