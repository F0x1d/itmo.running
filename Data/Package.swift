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
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                "Factory"
            ]
        )
    ]
)
