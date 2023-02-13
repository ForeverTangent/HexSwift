//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/19/21.
//

import Foundation

enum HDirection: Int, CaseIterable, Codable {
	case NE = 0		// EAST
	case E_SE = 1 	// NORTH EAST,
	case NW_N	= 2 // NORTH WEST
	case W_NW = 3 	// WEST
	case SW = 4 	// SOUTH WEST
	case SE_S = 5	// SOUTH EAST

	func rawHex() -> Hex {
		switch self {
			case .NE:		// NorthEast both Orientations
				return Hex(q: 1, r: -1, s: 0)
			case .E_SE:		// East - PointTop, SouthEast - FlatTop
				return Hex(q: 1, r: 0, s: -1)
			case .NW_N:		// NorthWest - PointTop, North - FlatTop
				return Hex(q: 0, r: 1, s: -1)
			case .W_NW:		// West - PointTop, NorthWest - FlatTop
				return Hex(q: -1, r: 1, s: 0)
			case .SW:		// SouthWest both Orientations
				return Hex(q: -1, r: 0, s: 1)
			case .SE_S:		// SouthEast - PointTop, South - FlatTop
				return Hex(q: 0, r: -1, s: 1)
		}
	}
}


/**
Cube storage, cube constructor
*/
struct Hex: Codable, Hashable {
	// MARK: - Properties

	let data: SIMD3<Int>
	var q: Int { data.x }
	var r: Int { data.y }
	var s: Int { data.z }

	public var neighbors: [Hex] {
		return HDirection.allCases.map { hexDirection in
			hexDirection.rawHex() + self
		}
	}

	// MARK: - Inits

	/**
	Hex cube coordinates q + r + s must equal == 0
	*/
	init(q: Int, r: Int, s: Int) {
		guard
			(q + r + s) == 0
		else {
			fatalError("HEX Coordinates q: \(q) + r: \(r) + s: \(s) must == 0")
		}
		self.data = SIMD3<Int>(x: q, y: r, z: s)
	}

	/**
	Hex axial coordinates
	*/
	init(q: Int, r: Int) {
		self.data = SIMD3<Int>(x: q, y: r, z: -q - r)
	}


	// MARK: - Static Methods

	static func distanceFromHexA(_ hexA: Hex, to hexB: Hex) -> Int {
		return (hexA - hexB).lenght()
	}


	// MARK: - Class Methods

	public func lenght() -> Int {
		return Int(abs(self.q) + abs(self.r) + abs(self.s) / 2)
	}

	public func distanceToHex(_ hex: Hex) -> Int {
		return Hex.distanceFromHexA(self, to: hex)
	}

	public func getNeighborInDirection(_ direction: HDirection) -> Hex {
		return direction.rawHex() + self
	}

	public func getNeighbor(_ index: Int) -> Hex {
		return neighbors[index]
	}

	public func getNeighbors() -> [Hex] {
		return neighbors
	}

	public func getCorners(withLayout hexLayout: HexLayout) -> [Point] {
		var corners = 0...5
		return corners.map { index in
			getCorner(index, withLayout: hexLayout)
		}
	}

	public func getCorner(_ cornerIndex: Int, withLayout hexLayout: HexLayout) -> Point {
		switch hexLayout.layout {
			case .flatTop:
				return getPointyTopHexCorner(
					index: cornerIndex,
					size: hexLayout.size,
					center: getCenterPoint(usingLayout: hexLayout))
			case .pointedTop:
				return getPointyTopHexCorner(
					index: cornerIndex,
					size: hexLayout.size,
					center: getCenterPoint(usingLayout: hexLayout))
		}
	}


	public func getCenterPoint(usingLayout layout: HexLayout) -> Point {
		return Hex.getPointFromHex(self, usingLayout: layout)
	}
	

	private func getPointyTopHexCorner(index: Int, size: Double, center: Point) -> Point {
		let angle_deg = 60 * Double(index) - 30
		let angle_rad = Double.pi / 180 * angle_deg

		return Point(x: center.x + size * cos(angle_rad),
					 y: center.y + size * sin(angle_rad))
	}

	private func getFlatTopHexCorner(index: Int, size: Double, center: Point) -> Point {
		let angle_deg = 60 * Double(index)
		let angle_rad = Double.pi / 180 * angle_deg

		return Point(x: center.x + size * cos(angle_rad),
					 y: center.y + size * sin(angle_rad))
	}

}

extension Hex: Points { }

extension Hex: HexConversion { }


// Hex Ops and Utils

extension Hex {
	static func + (lhs: Hex, rhs: Hex) -> Hex {
		return Hex(q: lhs.q + rhs.q, r: lhs.r + rhs.r, s: lhs.s + rhs.s)
	}

	static func - (lhs: Hex, rhs: Hex) -> Hex {
		return Hex(q: lhs.q - rhs.q, r: lhs.r - rhs.r, s: lhs.s - rhs.s)
	}

	static func += (lhs: inout Hex, rhs: Hex) -> Hex {
		return lhs + rhs
	}

	static func -= (lhs: inout Hex, rhs: Hex) -> Hex {
		return lhs - rhs
	}

	static func * (lhs: Hex, rhs: Int) -> Hex {
		return Hex(q: lhs.q * Int(rhs), r: lhs.r * Int(rhs), s: lhs.s * Int(rhs))
	}

	static func * (lhs: Int, rhs: Hex) -> Hex {
		return rhs * lhs
	}

	static func lerp(a: Double, b: Double, t: Double) -> Double {
		return a * (1 - t) + b * t
	}

	static func getLerpedFractionalHexFromHex(_ hexA: Hex, toHex hexB: Hex, byT t: Double) -> FractionalHex {
		return FractionalHex(q: Hex.lerp(a: Double(hexA.q), b: Double(hexB.q), t: t),
							 r: Hex.lerp(a: Double(hexA.r), b: Double(hexB.r), t: t),
							 s: Hex.lerp(a: Double(hexA.s), b: Double(hexB.s), t: t))
	}

	static func getLineOfHexesBetweenHex(_ hexA: Hex, andHex hexB: Hex) -> [Hex] {

		let hexDistance = hexA.distanceToHex(hexB)

		var results = [Hex]()

		let step = 1.0 / Double(max(hexDistance, 1))

		for index in 0...hexDistance {
			let fractionalHex = Hex.getLerpedFractionalHexFromHex(hexA, toHex: hexB, byT: step * Double(index))
			let roundedHex = FractionalHex.getRoundHexFromFractionalHex(fractionalHex)
			results.append(roundedHex)
		}

		return results

	}

	func getHexesBetweenSelfAndTarget(hex: Hex) -> [Hex] {
		return Hex.getLineOfHexesBetweenHex(self, andHex: hex)
	}

}


/**
Add in Etquatable Protocol
*/
extension Hex: Equatable { }


extension Hex: CustomStringConvertible {
	var description: String {
		return "HIntX q:\(self.q), r:\(self.r), s:\(self.s)"
	}

}
