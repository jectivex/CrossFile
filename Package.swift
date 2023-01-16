// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CrossFile",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
    ],
    products: [
        .library(name: "CrossFile", type: .static, targets: ["CrossFile"]),
        .library(name: "CrossFileJVM", type: .dynamic, targets: ["CrossFileJVM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jectivex/Skiff", branch: "main"),
    ],
    targets: [
        .target(name: "CrossFile", dependencies: []),
        .testTarget(name: "CrossFileTests", dependencies: ["CrossFile"]),
        .target(name: "CrossFileJVM", dependencies: ["Skiff"]),
        .testTarget(name: "CrossFileJVMTests", dependencies: ["CrossFileJVM"]),
    ]
)
