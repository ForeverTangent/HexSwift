//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

/**
 Hex Direction can be confusing.

 For Pointed Top A/0  starts NorthWest and goes around clockwise.

 For Flat Top A/0  starts Southeast and goes around counter-clockwise.

 */
enum HexDirection: Int, CaseIterable, Codable {
	case A = 0		// NorthWest - PointTop, SouthEast - FlatTop
	case B = 1 		// NorthEast both
	case C = 2 		// East - PointTop, North - FlatTop
	case D = 3 		// SouthEast - PointTop, NorthWest - FlatTop
	case E = 4 		// SouthWest both
	case F = 5		// West - PointTop, South - FlatTop
}

struct HexLayout {
	let layout: HexLayoutType
	var orientation: HexOrientation {
		layout.getOrientation()
	}
	let size: Double
	let origin: Point
	func getDirection(_ hexDirection: HexDirection) -> Hex {
		switch hexDirection {
			case .A:
				return Hex(q: 1, r: -1)
			case .B:
				return Hex(q: 1, r: 0)
			case .C:
				return Hex(q: 0, r: 1)
			case .D:
				return Hex(q: -1, r: 1)
			case .E:
				return Hex(q: -1, r: 0)
			case .F:
				return Hex(q: 0, r: -1)

		}
	}
}
