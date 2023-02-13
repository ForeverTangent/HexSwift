//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

enum HexLayoutType: Int, CaseIterable, Codable {
	case pointyTop
	case flatTop

	func getOrientation() -> HexOrientation {
		switch self {
			case .pointyTop:
				return HexOrientation(
					f0: sqrt(3.0), f1: sqrt(3.0) / 2.0, f2: 0.0, f3: 3.0 / 2.0,
					b0: sqrt(3.0) / 3.0, b1: -1.0 / 3.0, b2: 0.0, b3: 2.0 / 3.0,
					startingAngle: 0.5)
			case .flatTop:
				return HexOrientation(
					f0: 3.0 / 2.0, f1: 0.0, f2: sqrt(3.0) / 2.0, f3: sqrt(3.0),
					b0: 2.0 / 3.0, b1: 0.0, b2: -1.0 / 3.0, b3: sqrt(3.0) / 3.0,
					startingAngle: 0.0)
		}
	}
}



struct HexOrientation: Codable {
	let f0, f1, f2, f3: Double
	let b0, b1, b2, b3: Double
	let startingAngle: Double
}


