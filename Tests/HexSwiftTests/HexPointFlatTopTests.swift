import XCTest
@testable import HexSwift

final class HexPointFlatTopTests: XCTestCase {

	class TestContext {
		var initialHex = Hex(q: 0, r: 0)
		var hexLayout = HexLayout(
			layout: .flatTop,
			size: 10,
			origin: Point(x: 0, y: 0))
	}

	var testContext: TestContext!
	var subject: Hex!

    override func setUpWithError() throws {
        testContext = TestContext()
		subject = testContext.initialHex
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


	func testHexCorners() {

		let corners = subject.getCorners(withLayout: .init(layout: .flatTop, size: 10, origin: Point(x: 0, y: 0))).map({ point in
			Point(x: point.x.rounded(digits: 3), y: point.y.rounded(digits: 3))
		})

		XCTAssertEqual(corners[0].x.rounded(digits: 3), 8.66, "Corner 0.x incorrect")
		XCTAssertEqual(corners[0].y.rounded(digits: 3), -5.0, "Corner 0.y incorrect")

		XCTAssertEqual(corners[1].x.rounded(digits: 3), 8.66, "Corner 1.x incorrect")
		XCTAssertEqual(corners[1].y.rounded(digits: 3), 5.0, "Corner 1.y incorrect")

		XCTAssertEqual(corners[2].x.rounded(digits: 3), 0.0, "Corner 2.x incorrect")
		XCTAssertEqual(corners[2].y.rounded(digits: 3), 10.0, "Corner 2.y incorrect")

		XCTAssertEqual(corners[3].x.rounded(digits: 3), -8.66, "Corner 3.x incorrect")
		XCTAssertEqual(corners[3].y.rounded(digits: 3), 5.0, "Corner 3.y incorrect")

		XCTAssertEqual(corners[4].x.rounded(digits: 3), -8.66, "Corner 4.x incorrect")
		XCTAssertEqual(corners[4].y.rounded(digits: 3), -5.0, "Corner 4.y incorrect")

		XCTAssertEqual(corners[5].x.rounded(digits: 3), 0.0, "Corner 5.x incorrect")
		XCTAssertEqual(corners[5].y.rounded(digits: 3), -10.0, "Corner 5.y incorrect")

	}


	func testHexAndNeighborsCenterPoints() {

		let initialCenterPoint = Hex.getPointFromHex(
			subject,
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(initialCenterPoint.x, 0.0, "Initial Center X not 0.0")
		XCTAssertEqual(initialCenterPoint.y, 0.0, "Initial Center Y not 0.0")


		let neighbors = testContext.initialHex.neighbors

		// The FlatTop SouthEast Neighbor
		let neighbor_0 = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.NE),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(neighbor_0.x.rounded(digits: 3), 15.0, "FlatTop SouthEast Neighbor (0) incorrect")
		XCTAssertEqual(neighbor_0.y.rounded(digits: 3), -8.66, "FlatTop SouthEast Neighbor (0) incorrect")

		// The FlatTop NorthEast Neighbor
		let neighbor_1 = Hex.getPointFromHex(
			neighbors[1],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(neighbor_1.x.rounded(digits: 3), 15.0, "FlatTop NorthEast Neighbor (1) incorrect")
		XCTAssertEqual(neighbor_1.y.rounded(digits: 3), 8.66, "FlatTop NorthEast Neighbor (1) incorrect")

		// The FlatTop North Neighbor
		let neighbor_2 = Hex.getPointFromHex(
			neighbors[2],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(neighbor_2.x.rounded(digits: 3), 0.0, "FlatTop North Neighbor (2) incorrect")
		XCTAssertEqual(neighbor_2.y.rounded(digits: 3), 17.321, "FlatTop North Neighbor (2) incorrect")

		// The FlatTop NorthWest Neighbor
		let neighbor_3 = Hex.getPointFromHex(
			neighbors[3],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(neighbor_3.x.rounded(digits: 3), -15.0, "FlatTop NorthWest Neighbor (3) incorrect")
		XCTAssertEqual(neighbor_3.y.rounded(digits: 3), 8.66, "FlatTop NorthWest Neighbor (3) incorrect")

		// The FlatTop SouthWest Neighbor
		let neighbor_4 = Hex.getPointFromHex(
			neighbors[4],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(neighbor_4.x.rounded(digits: 3), -15.0, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(neighbor_4.y.rounded(digits: 3), -8.66, "FlatTop SouthWest Neighbor (4) incorrect")

		// The FlatTop South Neighbor
		let neighbor_5 = Hex.getPointFromHex(
			neighbors[5],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(neighbor_5.x.rounded(digits: 3), 0.0, "FlatTop South Neighbor (5) incorrect")
		XCTAssertEqual(neighbor_5.y.rounded(digits: 3), -17.321, "FlatTop South Neighbor (5) incorrect")

	}


}
