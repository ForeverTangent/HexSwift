//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/21/21.
//

import Foundation

struct HFractional {
	let q: Double
	let r: Double
	let s: Double

	static func getRoundHexFromFractionalHex(_ fractionalHex: HFractional) -> Hex {

		var q = Int(round(fractionalHex.q))
		var r = Int(round(fractionalHex.r))
		var s = Int(round(fractionalHex.s))

		let q_difference = abs(Double(q) - fractionalHex.q)
		let r_difference = abs(Double(r) - fractionalHex.r)
		let s_difference = abs(Double(s) - fractionalHex.s)

		if (q_difference > r_difference) && (q_difference > s_difference) {
			q = -r - s
		} else if (r_difference > s_difference) {
			r = -r - s
		} else {
			s = -q - r
		}

		return Hex(q: q, r: r, s: s)
	}

	func rounded() -> Hex {
		return HFractional.getRoundHexFromFractionalHex(self)
	}

}

