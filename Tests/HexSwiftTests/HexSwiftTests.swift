    import XCTest
    @testable import HexSwift

    final class HexSwiftTests: XCTestCase {
		func testHex() {
			// This is an example of a functional test case.
			// Use XCTAssert and related functions to verify your tests produce the correct
			// results.

			let hex1: Hex<Int32>? = Hex<Int32>(q: 1, r: 1, s: -2)
			XCTAssert(hex1 != nil)
		}

    }
