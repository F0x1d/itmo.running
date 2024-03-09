// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CoreDI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CoreDI",
            targets: ["CoreDI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/malcommac/SwiftLocation.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "CoreDI",
            dependencies: [
                "Factory",
                "SwiftLocation"
            ]
        )
    ]
)
