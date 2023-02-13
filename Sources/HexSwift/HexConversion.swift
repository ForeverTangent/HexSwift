//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/20/21.
//

import Foundation

protocol HexConversion {
	static func getPointFromHex(_ hex: Hex, usingLayout layout: HexLayout) -> Point
	func getFractionalHexFromPoint(_ cPoint: Point, usingLayout layout: HexLayout) -> FractionalHex
	
}

extension HexConversion {

	/**
	Get Hex To Pixel coordinates

	- Parameter hex: Hex
	- Parameter layout: HexLayout
	- Returns: Point
	*/
	static func getPointFromHex(_ hex: Hex, usingLayout layout: HexLayout) -> Point {

		let orientation = layout.orientation
		let x = (orientation.f0 * Double(hex.q) + orientation.f1 * Double(hex.s)) * Double(layout.size)
		let y = (orientation.f2 * Double(hex.q) + orientation.f3 * Double(hex.s)) * Double(layout.size)

		return Point(x: x, y: y)
	}

	func getFractionalHexFromPoint(_ point: Point, usingLayout layout: HexLayout) -> FractionalHex {
		
		let orientation = layout.orientation
		let cPoint = Point(x: (point.x - layout.origin.x) / layout.size,
							y: (point.y - layout.origin.y) / layout.size)
		
		let q = orientation.b0 * cPoint.x + orientation.b1 * cPoint.y
		let r = orientation.b2 * cPoint.x + orientation.b3 * cPoint.y
		
		return FractionalHex(q: q, r: r, s: -q - r)
		
	}


	// 0.5773502691 8962576450 9148780501 9574556476 0175127012 68760186



}
