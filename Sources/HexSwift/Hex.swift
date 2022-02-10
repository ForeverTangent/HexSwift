//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/19/21.
//

import Foundation

enum HexDirection: Int, CaseIterable, Codable {
	case ea = 0	// EAST
	case ne = 1 // NORTH EAST
	case nw	= 2 // NORTH WEST
	case we = 3 // WEST
	case sw = 4 // SOUTH WEST
	case se = 5	// SOUTH EAST

	func rawHex() -> Hex {
		switch self {
			case .ea:
				return Hex(q: 1, r: -1, s: 0)
			case .ne:
				return Hex(q: 1, r: 0, s: -1)
			case .nw:
				return Hex(q: 0, r: 1, s: -1)
			case .we:
				return Hex(q: -1, r: 1, s: 0)
			case .sw:
				return Hex(q: -1, r: 0, s: 1)
			case .se:
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
		return HexDirection.allCases.map { hexDirection in
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

	public func getNeighborInDirection(_ direction: HexDirection) -> Hex {
		return direction.rawHex() + self
	}

	public func getNeighbor(_ index: Int) -> Hex {
		return neighbors[index]
	}


}

extension Hex: HexPoints { }

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
