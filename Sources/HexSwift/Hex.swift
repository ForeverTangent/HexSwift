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
struct Hex<E: SignedInteger & SIMDScalar>: Codable {

	// MARK: - Properties

	let data: SIMD3<E>
	var q: E { data.x }
	var r: E { data.y }
	var s: E { data.z }

	// MARK: - Inits

	/**
	Hex cube coordinates q + r + s must equal == 0
	*/
	init?(q: E, r: E, s: E) {
		guard
			(q + r + s) == 0
		else {
			return nil
		}
		self.data = SIMD3<E>(x: q, y: r, z: s)
	}

	/**
	Hex axial coordinates
	*/
	init?(q: E, r: E) {
		self.data = SIMD3<E>(x: q, y: r, z: -q - r)
	}

}


extension Hex {
	static func + (lhs: Hex<E>, rhs: Hex<E>) -> Hex<E> {
		return Hex<E>(q: lhs.q + rhs.q, r: lhs.r + rhs.r, s: lhs.s + rhs.s)!
	}

	static func - (lhs: Hex<E>, rhs: Hex<E>) -> Hex<E> {
		return Hex<E>(q: lhs.q - rhs.q, r: lhs.r - rhs.r, s: lhs.s - rhs.s)!
	}

	static func += (lhs: inout Hex<E>, rhs: Hex<E>) -> Hex<E> {
		return lhs + rhs
	}

	static func -= (lhs: inout Hex<E>, rhs: Hex<E>) -> Hex<E> {
		return lhs - rhs
	}

	static func * (lhs: Hex<E>, rhs: Int) -> Hex<E> {
		return Hex(q: lhs.q * E(rhs), r: lhs.r * E(rhs), s: lhs.s * E(rhs))!
	}

	static func * (lhs: Int, rhs: Hex<E>) -> Hex<E> {
		return rhs * lhs
	}

}


/**
Add in Equatable Protocol
*/
extension Hex: Equatable { }


extension Hex: CustomStringConvertible {
	var description: String {
		return "HEX q:\(self.q), r:\(self.r), s:\(self.s)"
	}

}
