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

		// The FlatTop SouthEast Neighbor
		let southEastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.A),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southEastNeighbor.x.rounded(digits: 3), 15.0, "FlatTop SouthEast Neighbor (0) incorrect")
		XCTAssertEqual(southEastNeighbor.y.rounded(digits: 3), -8.66, "FlatTop SouthEast Neighbor (0) incorrect")

		// The FlatTop NorthEast Neighbor
		let northEastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.B),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northEastNeighbor.x.rounded(digits: 3), 15.0, "FlatTop NorthEast Neighbor (1) incorrect")
		XCTAssertEqual(northEastNeighbor.y.rounded(digits: 3), 8.66, "FlatTop NorthEast Neighbor (1) incorrect")

		// The FlatTop North Neighbor
		let northNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.C),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northNeighbor.x.rounded(digits: 3), 0.0, "FlatTop North Neighbor (2) incorrect")
		XCTAssertEqual(northNeighbor.y.rounded(digits: 3), 17.321, "FlatTop North Neighbor (2) incorrect")

//		// The FlatTop NorthWest Neighbor
		let northWestNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.D),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northWestNeighbor.x.rounded(digits: 3), -15.0, "FlatTop NorthWest Neighbor (3) incorrect")
		XCTAssertEqual(northWestNeighbor.y.rounded(digits: 3), 8.66, "FlatTop NorthWest Neighbor (3) incorrect")

//		// The FlatTop SouthWest Neighbor
		let southWestNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.E),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southWestNeighbor.x.rounded(digits: 3), -15.0, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(southWestNeighbor.y.rounded(digits: 3), -8.66, "FlatTop SouthWest Neighbor (4) incorrect")

//		// The FlatTop South Neighbor
		let southNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(HexDirection.F),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southNeighbor.x.rounded(digits: 3), 0.0, "FlatTop South Neighbor (3) incorrect")
		XCTAssertEqual(southNeighbor.y.rounded(digits: 3), -17.321, "FlatTop South Neighbor (3) incorrect")

	}


	func testHexNeighborsCenterPointsByIndex() {

		let initialCenterPoint = Hex.getPointFromHex(
			subject,
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(initialCenterPoint.x, 0.0, "Initial Center X not 0.0")
		XCTAssertEqual(initialCenterPoint.y, 0.0, "Initial Center Y not 0.0")

		// The FlatTop SouthEast Neighbor
		let southEastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.neighbors[0],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southEastNeighbor.x.rounded(digits: 3), 15.0, "FlatTop SouthEast Neighbor (0) incorrect")
		XCTAssertEqual(southEastNeighbor.y.rounded(digits: 3), -8.66, "FlatTop SouthEast Neighbor (0) incorrect")

		// The FlatTop NorthEast Neighbor
		let northEastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.neighbors[1],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northEastNeighbor.x.rounded(digits: 3), 15.0, "FlatTop NorthEast Neighbor (1) incorrect")
		XCTAssertEqual(northEastNeighbor.y.rounded(digits: 3), 8.66, "FlatTop NorthEast Neighbor (1) incorrect")

		// The FlatTop North Neighbor
		let northNeighbor = Hex.getPointFromHex(
			testContext.initialHex.neighbors[2],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northNeighbor.x.rounded(digits: 3), 0.0, "FlatTop North Neighbor (2) incorrect")
		XCTAssertEqual(northNeighbor.y.rounded(digits: 3), 17.321, "FlatTop North Neighbor (2) incorrect")

		//		// The FlatTop NorthWest Neighbor
		let northWestNeighbor = Hex.getPointFromHex(
			testContext.initialHex.neighbors[3],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northWestNeighbor.x.rounded(digits: 3), -15.0, "FlatTop NorthWest Neighbor (3) incorrect")
		XCTAssertEqual(northWestNeighbor.y.rounded(digits: 3), 8.66, "FlatTop NorthWest Neighbor (3) incorrect")

		//		// The FlatTop SouthWest Neighbor
		let southWestNeighbor = Hex.getPointFromHex(
			testContext.initialHex.neighbors[4],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southWestNeighbor.x.rounded(digits: 3), -15.0, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(southWestNeighbor.y.rounded(digits: 3), -8.66, "FlatTop SouthWest Neighbor (4) incorrect")

		//		// The FlatTop South Neighbor
		let southNeighbor = Hex.getPointFromHex(
			testContext.initialHex.neighbors[5],
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southNeighbor.x.rounded(digits: 3), 0.0, "FlatTop South Neighbor (3) incorrect")
		XCTAssertEqual(southNeighbor.y.rounded(digits: 3), -17.321, "FlatTop South Neighbor (3) incorrect")

	}


}
