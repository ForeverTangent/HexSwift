//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/21/21.
//

import Foundation

protocol HexPoints: HexConversion {
	static func hexCornerOffsetUsingLayout(_ layout: Layout, andCornerIndex index: Int) -> Point
	static func hexCornersUsingLayout(_ layout: Layout, andHex hex: Hex) -> [Point]
}

extension HexPoints {

	static func hexCornerOffsetUsingLayout(_ layout: Layout, andCornerIndex index: Int) -> Point {
		let size = layout.size
		let angle = 2.0 * Double.pi * (layout.orientation.startingAngle + Double(index)) / 6

		return Point(x: size.x * cos(angle),
					  y: size.y * sin(angle))
	}

	static func hexCornersUsingLayout(_ layout: Layout, andHex hex: Hex) -> [Point] {
		var corners = [Point]()
		let center = getPointFromHex(hex, usingLayout: layout)
		for index in 0...6 {
			let offset = hexCornerOffsetUsingLayout(layout, andCornerIndex: index)
			corners.append(Point(x: center.x + offset.x,
								  y: center.y + offset.y))
		}
		return corners

	}

}

