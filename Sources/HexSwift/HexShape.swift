//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 8/3/21.
//

import Foundation

class HexShape {

	static func Parallelogram(q1: Int, q2: Int, r1: Int, r2: Int) -> Set<Hex> {
		guard
			q1 <= q2,
			r1 <= r2
		else {
			return Set<Hex>()
		}

		var results = Set<Hex>()

		for q in q1...q2 {
			for r in r1...r2 {
				results.insert(Hex(q: q, r: r, s: -q-r))
			}
		}
		return results
	}


	static func Triangle1(q: Int, sideLegnth: Int) -> Set<Hex> {

		var results = Set<Hex>()

		for q in 0...sideLegnth {
			for r in 0...(sideLegnth - q) {
				results.insert(Hex(q: q, r: r, s: -q-r))
			}
		}
		return results

	}

	static func Triangle2(q: Int, sideLegnth: Int) -> Set<Hex> {

		var results = Set<Hex>()

		for q in 0...sideLegnth {
			for r in stride(from: (sideLegnth - q), to: 0, by: -1) {
				results.insert(Hex(q: q, r: r, s: -q-r))
			}
		}
		return results

	}


	static func Hexagon(radius: Int) -> Set<Hex> {

		var results = Set<Hex>()

		for q in -radius...radius {
			let r1 = max(-radius, -q - radius)
			let r2 = min(radius, -q + radius)
			if r1 <= r2 {
				for r in r1...r2 {
					results.insert(Hex(q: q, r: r, s: -q-r))
				}
			}
		}

		return results
	}


}




