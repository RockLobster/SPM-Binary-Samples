// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPM-Binary-Samples",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SourceSampleHelloWorldSwift",
            targets: ["SourceSampleHelloWorldSwift"]),

        .library(
            name: "SourceSampleHelloWorldObjC",
            targets: ["SourceSampleHelloWorldObjC"]),
    ],
    dependencies: [],
    targets: [

        // A Swift target build from Source code
        .target(
            name: "SourceSampleHelloWorldSwift",
            path: "Sources/Swift"),

        .target(
            name: "SourceSampleHelloWorldObjC",
            path: "Sources/ObjC")
    ]
)
