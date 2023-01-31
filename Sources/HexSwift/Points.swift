//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/21/21.
//

import Foundation

protocol Points: HConversion {
	static func hexCornerOffSetUsingLayout(_ layout: HLayout, andCornerIndex index: Int) -> CPoint
	static func hexCornersUsingLayout(_ layout: HLayout, andHex hex: Hex) -> [CPoint]
}

extension Points {

	static func hexCornerOffSetUsingLayout(_ layout: HLayout, andCornerIndex index: Int) -> CPoint {
		let size = layout.size
		let angle = 2.0 * Double.pi * (layout.orientation.startingAngle + Double(index)) / 6

		return CPoint(x: size.x * cos(angle),
					  y: size.y * sin(angle))
	}

	static func hexCornersUsingLayout(_ layout: HLayout, andHex hex: Hex) -> [CPoint] {
		var corners = [CPoint]()
		let center = getPointFromHex(hex, usingLayout: layout)
		for index in 0...6 {
			let offset = hexCornerOffSetUsingLayout(layout, andCornerIndex: index)
			corners.append(CPoint(x: center.x + offset.x,
								  y: center.y + offset.y))
		}
		return corners

	}

	/**
	 Converstions

	Square : Hex
	 1 : 0.6204032394
	 1.6118548977 : 1

	 // 0.5773502691896257645091487805019574556476017512701268760186

	 */

//	static func cartToHexNorm(_ value: Double) -> Double {
//		return Double(value) * 0.6204032394
//	}
//
//	static func hexToCartNorm(_ value: Double) -> Double {
//		return Double(value) / 0.6204032394
//	}

}

