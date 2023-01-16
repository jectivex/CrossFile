import XCTest
#if canImport(CrossFileJVM)
@testable import CrossFileJVM
import Skiff
#else
@testable import CrossFile
#endif

final class CrossFileTests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue(try CrossFile().exists(path: "/dev/null"))
    }

    #if canImport(Skiff)
    public func testTranslateFramework() throws {
        let projectBase = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        let sourceBase = URL(fileURLWithPath: "Sources", isDirectory: true, relativeTo: projectBase)
        let sourceURL = URL(fileURLWithPath: "CrossFile/CrossFile.swift", isDirectory: false, relativeTo: sourceBase)
        let kotlinURL = URL(fileURLWithPath: "CrossFileKotlin/CrossFile.kt", isDirectory: false, relativeTo: sourceBase)

        let skiff = try Skiff()

        var source = try String(contentsOf: sourceURL)
        var kotlin = try skiff.translate(swift: source, autoport: true)
        kotlin = "package CrossFile\n\n" + kotlin
        print("## Kotlin:\n", kotlin)
        try kotlin.write(to: kotlinURL, atomically: true, encoding: .utf8)
    }
    #endif

}
