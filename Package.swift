// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CrossFile",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
    ],
    products: [
        .library(name: "CrossFile", targets: ["CrossFile"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jectivex/Skiff", branch: "main"),
        .package(url: "https://github.com/jectivex/Gryphon", branch: "main"),
        .package(url: "https://github.com/jectivex/Kanji", branch: "main"),
    ],
    targets: [
        .target(name: "CrossFile", dependencies: []),
        .testTarget(name: "CrossFileTests", dependencies: ["CrossFile"]),
        .target(name: "CrossFileJVM", dependencies: [
            .product(name: "Skiff", package: "Skiff", condition: .when(platforms: [.macOS])),
            .product(name: "GryphonLib", package: "Gryphon", condition: .when(platforms: [.macOS])),
            .product(name: "KanjiVM", package: "Kanji", condition: .when(platforms: [.macOS])),
            .product(name: "JavaLib", package: "Kanji", condition: .when(platforms: [.macOS])),
        ]),
        .testTarget(name: "CrossFileJVMTests", dependencies: ["CrossFileJVM"]),
    ]
)
