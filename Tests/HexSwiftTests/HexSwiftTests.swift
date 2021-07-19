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


		func testHexAddition() {
			// This is an example of a functional test case.
			// Use XCTAssert and related functions to verify your tests produce the correct
			// results.

			let hex1 = Hex<Int32>(q: 1, r: 1, s: -2)!
			let hex2 = Hex<Int32>(q: 1, r: 1, s: -2)!

			let hex3 = hex1 + hex2
			print(hex3)
			let targetHex = Hex<Int32>(q: 2, r: 2, s: -4)
			XCTAssert(hex3 == targetHex, "\(hex3) == \(String(describing: targetHex))")
		}

		func testHexSubstraction() {
			// This is an example of a functional test case.
			// Use XCTAssert and related functions to verify your tests produce the correct
			// results.

			let hex1 = Hex<Int32>(q: 1, r: 1, s: -2)!
			let hex2 = Hex<Int32>(q: 1, r: 1, s: -2)!

			let hex3 = hex1 - hex2
			print(hex3)
			let targetHex = Hex<Int32>(q: 0, r: 0, s: 0)
			XCTAssert(hex3 == targetHex, "\(hex3) == \(String(describing: targetHex))")
		}

		func testHexMultiplication() {
			// This is an example of a functional test case.
			// Use XCTAssert and related functions to verify your tests produce the correct
			// results.

			let hex1 = Hex<Int32>(q: 1, r: 1, s: -2)!

			let hex2 = hex1 * 3
			print(hex2)
			let targetHex1 = Hex<Int32>(q: 3, r: 3, s: -6)
			XCTAssert(hex2 == targetHex1, "\(hex2) == \(String(describing: targetHex1))")

			let hex3 = 3 * hex1
			print(hex3)
			let targetHex2 = Hex<Int32>(q: 3, r: 3, s: -6)
			XCTAssert(hex3 == targetHex2, "\(hex3) == \(String(describing: targetHex2))")
		}

    }
