// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLSPClient",
    platforms: [.macOS("10.10"), .iOS("14.0")],
    products: [
        .library(name: "SwiftLSPClient", type: .dynamic, targets: ["SwiftLSPClient"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SwiftLSPClient", dependencies: [], path: "SwiftLSPClient/"),
        .testTarget(name: "SwiftLSPClientTests", dependencies: ["SwiftLSPClient"], path: "SwiftLSPClientTests/"),
    ]
)
