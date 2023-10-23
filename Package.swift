// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HexColor",
    platforms: [.iOS(.v16), .macOS(.v13), .watchOS(.v9), .tvOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HexColor",
            targets: ["HexColor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bencmorrison/PrettyBinaryIntegerString", from: .init(1, 0, 0))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HexColor",
            dependencies: ["PrettyBinaryIntegerString"]),
        .testTarget(
            name: "HexColorTests",
            dependencies: ["HexColor"]),
    ]
)
