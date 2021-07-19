    import XCTest
    @testable import HexSwift

    final class HexSwiftTests: XCTestCase {
		func testHex() {
			// This is an example of a functional test case.
			// Use XCTAssert and related functions to verify your tests produce the correct
			// results.

			var testHex: Hex<Int32>?

			testHex = Hex<Int32>(q: 1, r: 1, s: -2)
			XCTAssert(testHex != nil,
					  "Hex coordinates q: \(String(describing: testHex?.q)) + r: \(String(describing: testHex?.r)) + s: \(String(describing: testHex?.s)) must equal == 0")

			testHex = nil

			testHex = Hex<Int32>(q: 1, r: 1, s: 0)
			XCTAssert(testHex == nil,
					  "Hex coordinates q: \(String(describing: testHex?.q)) + r: \(String(describing: testHex?.r)) + s: \(String(describing: testHex?.s)) must equal == 0")
		}

    }
