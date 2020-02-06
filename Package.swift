// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "URLComponentsHelpers",
    products: [
        .library(
            name: "URLComponentsHelpers",
            targets: ["URLComponentsHelpers"]),
    ],
    targets: [
        .target(
            name: "URLComponentsHelpers",
            dependencies: []),
        .testTarget(
            name: "URLComponentsHelpersTests",
            dependencies: ["URLComponentsHelpers"]),
    ]
)
