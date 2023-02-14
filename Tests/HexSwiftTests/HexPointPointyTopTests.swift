import XCTest
@testable import HexSwift

final class HexPointPointyTopTests: XCTestCase {

	class TestContext {
		var initialHex = Hex(q: 0, r: 0)
		var hexLayout = HexLayout(
			layout: .pointyTop,
			size: 10,
			origin: Point(x: 0, y: 0))
	}

	var testContext: TestContext!
	var subject: Hex!

	override func setUpWithError() throws {
		testContext = TestContext()
		subject = testContext.initialHex
	}

	func testHexCorners() {

		let corners = subject.getCorners(
			withLayout: .init(
				layout: .pointyTop,
				size: 10,
				origin: Point(
					x: 0,
					y: 0))).map({ point in
						Point(
							x: point.x.rounded(digits: 3),
							y: point.y.rounded(digits: 3))
					})

		print(corners)

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

		// The PointyTop East Neighbor
		let eastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(
				.A,
				withLayout: testContext.hexLayout),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(eastNeighbor.x.rounded(digits: 3), 17.321, "FlatTop SouthEast Neighbor incorrect")
		XCTAssertEqual(eastNeighbor.y.rounded(digits: 3), 0.0, "FlatTop SouthEast Neighbor incorrect")

		// The PointyTop SouthEast Neighbor
		let southEastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(
				.B,
				withLayout: testContext.hexLayout),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southEastNeighbor.x.rounded(digits: 3), 8.66, "FlatTop SouthEast Neighbor incorrect")
		XCTAssertEqual(southEastNeighbor.y.rounded(digits: 3), -15.0, "FlatTop SouthEast Neighbor incorrect")


		// The PointyTop SouthWest Neighbor
		let southWestNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(
				.C,
				withLayout: testContext.hexLayout),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(southWestNeighbor.x.rounded(digits: 3), -8.66, "FlatTop SouthEast Neighbor incorrect")
		XCTAssertEqual(southWestNeighbor.y.rounded(digits: 3), -15.0, "FlatTop SouthEast Neighbor incorrect")

		// The PointyTop West Neighbor
		let westNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(
				.D,
				withLayout: testContext.hexLayout),
			usingLayout: testContext.hexLayout)


		XCTAssertEqual(westNeighbor.x.rounded(digits: 3), -17.321, "FlatTop SouthEast Neighbor (0) incorrect")
		XCTAssertEqual(westNeighbor.y.rounded(digits: 3), 0.0, "FlatTop SouthEast Neighbor (0) incorrect")

		// The PointyTop SouthWest Neighbor
		let northWestNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(
				.E,
				withLayout: testContext.hexLayout),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northWestNeighbor.x.rounded(digits: 3), -8.66, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(northWestNeighbor.y.rounded(digits: 3), 15.0, "FlatTop SouthWest Neighbor (4) incorrect")

		// The PointyTop NorthEast Neighbor
		let northEastNeighbor = Hex.getPointFromHex(
			testContext.initialHex.getNeighborInDirection(
				HexDirection.F,
				withLayout: testContext.hexLayout),
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(northEastNeighbor.x.rounded(digits: 3), 8.66, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(northEastNeighbor.y.rounded(digits: 3), 15.0, "FlatTop SouthWest Neighbor (4) incorrect")
	}


	func testHexAndNeighborByIndexCenterPointsB() throws {

		var centerPoint = Hex.getPointFromHex(
			subject,
			usingLayout: testContext.hexLayout)

		XCTAssertEqual(centerPoint.x, 0.0, "Initial Center X not 0.0")
		XCTAssertEqual(centerPoint.y, 0.0, "Initial Center Y not 0.0")

		// The PointyTop East Neighbor

		let eastNeighbor = try XCTUnwrap(testContext.initialHex.getNeighbor(
			0,
			withLayout: testContext.hexLayout))
		centerPoint = Hex.getPointFromHex(
			eastNeighbor,
			usingLayout: testContext.hexLayout)
		XCTAssertEqual(centerPoint.x.rounded(digits: 3), 17.321, "FlatTop SouthEast Neighbor incorrect")
		XCTAssertEqual(centerPoint.y.rounded(digits: 3), 0.0, "FlatTop SouthEast Neighbor incorrect")


		// The PointyTop SouthEast Neighbor
		let southEastNeighbor = try XCTUnwrap(testContext.initialHex.getNeighbor(
			1,
			withLayout: testContext.hexLayout))
		centerPoint = Hex.getPointFromHex(
			southEastNeighbor,
			usingLayout: testContext.hexLayout)
		XCTAssertEqual(centerPoint.x.rounded(digits: 3), 8.66, "FlatTop SouthEast Neighbor incorrect")
		XCTAssertEqual(centerPoint.y.rounded(digits: 3), -15.0, "FlatTop SouthEast Neighbor incorrect")


		// The PointyTop SouthWest Neighbor
		let southWestNeighbor = try XCTUnwrap(testContext.initialHex.getNeighbor(
			2,
			withLayout: testContext.hexLayout))
		centerPoint = Hex.getPointFromHex(
			southWestNeighbor,
			usingLayout: testContext.hexLayout)
		XCTAssertEqual(centerPoint.x.rounded(digits: 3), -8.66, "FlatTop SouthEast Neighbor incorrect")
		XCTAssertEqual(centerPoint.y.rounded(digits: 3), -15.0, "FlatTop SouthEast Neighbor incorrect")

		// The PointyTop West Neighbor
		let westNeighbor = try XCTUnwrap(testContext.initialHex.getNeighbor(
			3,
			withLayout: testContext.hexLayout))
		centerPoint = Hex.getPointFromHex(
			westNeighbor,
			usingLayout: testContext.hexLayout)
		XCTAssertEqual(centerPoint.x.rounded(digits: 3), -17.321, "FlatTop SouthEast Neighbor (0) incorrect")
		XCTAssertEqual(centerPoint.y.rounded(digits: 3), 0.0, "FlatTop SouthEast Neighbor (0) incorrect")

		// The PointyTop SouthWest Neighbor
		let northWestNeighbor = try XCTUnwrap(testContext.initialHex.getNeighbor(
			4,
			withLayout: testContext.hexLayout))
		centerPoint = Hex.getPointFromHex(
			northWestNeighbor,
			usingLayout: testContext.hexLayout)
		XCTAssertEqual(centerPoint.x.rounded(digits: 3), -8.66, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(centerPoint.y.rounded(digits: 3), 15.0, "FlatTop SouthWest Neighbor (4) incorrect")

		// The PointyTop NorthEast Neighbor
		let northEastNeighbor = try XCTUnwrap(testContext.initialHex.getNeighbor(
			5,
			withLayout: testContext.hexLayout))
		centerPoint = Hex.getPointFromHex(
			northEastNeighbor,
			usingLayout: testContext.hexLayout)
		XCTAssertEqual(centerPoint.x.rounded(digits: 3), 8.66, "FlatTop SouthWest Neighbor (4) incorrect")
		XCTAssertEqual(centerPoint.y.rounded(digits: 3), 15.0, "FlatTop SouthWest Neighbor (4) incorrect")
	}




}
