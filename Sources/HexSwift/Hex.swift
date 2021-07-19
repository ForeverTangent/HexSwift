//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/19/21.
//

import Foundation

/**
Cube storage, cube constructor
*/
struct Hex<E: SignedInteger & SIMDScalar> {

	// MARK: Properties

	let data: SIMD3<E>
	var q: E { data.x }
	var r: E { data.y }
	var s: E { data.z }

	// MARK: Init

	init(q: E, r: E, s: E) {
		guard
			(q + r + s) == 0
		else {
			fatalError("Hex coordinates q: \(q) + r: \(r) + s: \(s) must equal == 0")
		}
		self.data = SIMD3<E>(x: q, y: r, z: s)
	}


}
