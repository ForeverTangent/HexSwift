//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 2/12/23.
//

import Foundation

extension Double {
	/**
	 Handy decimal round function I found [here](https://stackoverflow.com/a/54372912)
	 - Parameter digits: Int
	 - Returns: Double
	 */
	func rounded(digits: Int) -> Double {
		let multiplier = pow(10.0, Double(digits))
		return (self * multiplier).rounded() / multiplier
	}
}
