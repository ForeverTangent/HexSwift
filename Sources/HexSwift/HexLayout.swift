//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

/**
 Hex Direction goes around counter clockwise

 For Flat Top A/0  starts NorthWest

 For Pointy Top A/0  starts East

 */
enum HexDirection: Int, CaseIterable, Codable {
	case A = 0		// NorthEast - FlatTop, East - PointyTop
	case B = 1 		// SouthEast - Both
	case C = 2 		// South - FlatTop, SouthWest - PointyTop
	case D = 3 		// SouthWest - FlatTop, West - PointyTop
	case E = 4 		// NorthWest both
	case F = 5		// North - FlatTop, NorthEast - PointyTop
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
