import XCTest
@testable import HexSwift

final class HexPointFlatTopTests: XCTestCase {

	class TextContext {
		var initialHex = Hex(q: 0, r: 0)
		var hexLayout = HexLayout(
			type: .flatTop,
			size: 10,
			origin: Point(x: 0, y: 0))
	}

	class Subject: HexConversion { }

	var textContext: TextContext!
	var subject: Subject!

    override func setUpWithError() throws {
        textContext = TextContext()
		subject = Subject()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


	func testHexCorners() {

	}


	func testHexAndNeighborsCenterPoints() {

		let initialCenterPoint = HexPointFlatTopTests.Subject.getPointFromHex(
			textContext.initialHex,
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(initialCenterPoint.x, 0.0, "Initial Center X not 0.0")
		XCTAssertEqual(initialCenterPoint.y, 0.0, "Initial Center Y not 0.0")


		let neighbors = textContext.initialHex.neighbors

		// The FlatTop SouthEast Neighbor
		let neighbor_0 = HexPointFlatTopTests.Subject.getPointFromHex(
			neighbors[0],
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(neighbor_0.x.rounded(digits: 3), 15.0, "FlatTop SouthEast Neighbor (0) incorrect")
		XCTAssertEqual(neighbor_0.y.rounded(digits: 3), -8.66, "FlatTop SouthEast Neighbor (0) incorrect")

		// The FlatTop NorthEast Neighbor
		let neighbor_1 = HexPointFlatTopTests.Subject.getPointFromHex(
			neighbors[1],
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(neighbor_1.x.rounded(digits: 3), 15.0, "FlatTop NorthEast Neighbor (1) incorrect")
		XCTAssertEqual(neighbor_1.y.rounded(digits: 3), 8.66, "FlatTop NorthEast Neighbor (1) incorrect")

		// The FlatTop North Neighbor
		let neighbor_2 = HexPointFlatTopTests.Subject.getPointFromHex(
			neighbors[2],
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(neighbor_2.x.rounded(digits: 3), 0.0, "FlatTop North Neighbor (2) incorrect")
		XCTAssertEqual(neighbor_2.y.rounded(digits: 3), 17.321, "FlatTop North Neighbor (2) incorrect")

		// The FlatTop NorthWest Neighbor
		let neighbor_3 = HexPointFlatTopTests.Subject.getPointFromHex(
			neighbors[3],
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(neighbor_3.x.rounded(digits: 3), -15.0, "FlatTop NorthWest Neighbor (3) incorrect")
		XCTAssertEqual(neighbor_3.y.rounded(digits: 3), 8.66, "FlatTop NorthWest Neighbor (3) incorrect")

		// The FlatTop SouthWest Neighbor
		let neighbor_4 = HexPointFlatTopTests.Subject.getPointFromHex(
			neighbors[4],
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(neighbor_4.x.rounded(digits: 3), -15.0, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(neighbor_4.y.rounded(digits: 3), -8.66, "FlatTop SouthWest Neighbor (4) incorrect")

		// The FlatTop South Neighbor
		let neighbor_5 = HexPointFlatTopTests.Subject.getPointFromHex(
			neighbors[5],
			usingLayout: textContext.hexLayout)

		XCTAssertEqual(neighbor_5.x.rounded(digits: 3), 0.0, "FlatTop South Neighbor (5) incorrect")
		XCTAssertEqual(neighbor_5.y.rounded(digits: 3), -17.321, "FlatTop South Neighbor (5) incorrect")

	}


}
