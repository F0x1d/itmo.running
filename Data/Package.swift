// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]
        )
    ],
    targets: [
        .target(
            name: "Data"
        )
    ]
)
