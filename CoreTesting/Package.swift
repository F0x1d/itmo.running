// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CoreTesting",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CoreTesting",
            targets: ["CoreTesting"]
        )
    ],
    dependencies: [
        .package(path: "../CoreDI"),
        .package(path: "../FeatureWelcome"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/malcommac/SwiftLocation.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "CoreTesting",
            dependencies: [
                "CoreDI",
                "FeatureWelcome",
                "Factory",
                "SwiftLocation"
            ]
        )
    ]
)
