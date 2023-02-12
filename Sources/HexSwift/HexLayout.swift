//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

struct HexLayout {
	let type: HexLayoutType
	var orientation: HexOrientation {
		type.getOrientation()
	}
	let size: Double
	let origin: Point
}
