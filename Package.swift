// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPM-Binary-Samples",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SPM-Binary-Samples",
            targets: [
                "SourceSampleHelloWorldSwift",
                "SourceSampleHelloWorldObjC",
                "BinarySampleHelloWorldSwift",
                "BinarySampleHelloWorldObjC"
            ]
        )
    ],
    dependencies: [],
    targets: [

        // A Swift target built from source code
        .target(
            name: "SourceSampleHelloWorldSwift",
            path: "Sources/Swift",
            exclude: [ "Info.plist" ]),

        // An ObjC target built from source code
        .target(
            name: "SourceSampleHelloWorldObjC",
            path: "Sources/ObjC",
            exclude: [ "Info.plist" ]),

        // A bundled Swift binary target
        .binaryTarget(
            name: "BinarySampleHelloWorldObjC",
            path: "Binaries/BinarySampleHelloWorldObjC.xcframework"),

        // A bundled ObjC binary target
        .binaryTarget(
            name: "BinarySampleHelloWorldSwift",
            path: "Binaries/BinarySampleHelloWorldSwift.xcframework")
    ]
)
