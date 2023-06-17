// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v15) ,.macOS(.v10_15)],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Common", path: "../Common"),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: []),
        .target(
            name: "Preview",
            dependencies: ["Common", "Domain"]),
        .target(
            name: "Home",
            dependencies: ["Common", "DesignSystem", "Preview", "Domain"]),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["Home"]),
    ]
)
