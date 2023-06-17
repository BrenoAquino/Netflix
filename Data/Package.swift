// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15) ,.macOS(.v10_15)],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Common", path: "../Common"),
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: ["Common", "Domain"]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
