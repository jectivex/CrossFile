import XCTest
#if canImport(CrossFileJVM)
@testable import CrossFileJVM
#else
@testable import CrossFile
#endif

final class CrossFileTests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue(try CrossFile().exists(path: "/dev/null"))
    }
}
