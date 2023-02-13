//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

struct HexLayout {
	let layout: HexLayoutType
	var orientation: HexOrientation {
		layout.getOrientation()
	}
	let size: Double
	let origin: Point
}
