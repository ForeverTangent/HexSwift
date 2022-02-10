//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

protocol HexConversion {
	static func getPointFromHex(_ hex: Hex, usingLayout layout: Layout) -> Point
	static func getFractionalHexFromCPoint(_ cPoint: Point, usingLayout layout: Layout) -> FractionalHex
	
}

extension HexConversion {

	/**
	Get Hex To Pixel coordinates

	*/
	static func getPointFromHex(_ hex: Hex, usingLayout layout: Layout) -> Point {

		let orientation = layout.orientation
		let x = (orientation.f0 * Double(hex.q) + orientation.f1 * Double(hex.r)) * Double(layout.size.x)
		let y = (orientation.f2 * Double(hex.q) + orientation.f3 * Double(hex.r)) * Double(layout.size.y)

		return Point(x: x, y: y)
	}

	static func getFractionalHexFromCPoint(_ cPoint: Point, usingLayout layout: Layout) -> FractionalHex {
		
		let orientation = layout.orientation
		let cPoint = Point(x: (cPoint.x - layout.origin.x) / layout.size.x,
							y: (cPoint.y - layout.origin.y) / layout.size.y)
		
		let q = orientation.b0 * cPoint.x + orientation.b1 * cPoint.y
		let r = orientation.b2 * cPoint.x + orientation.b3 * cPoint.y
		
		return FractionalHex(q: q, r: r, s: -q - r)
		
	}


}
