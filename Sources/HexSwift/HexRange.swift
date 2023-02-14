//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 2/13/23.
//

import Foundation

protocol HexRange {
	static func getHexesWithin(range: Int, ofHex hex: Hex) -> Set<Hex>
	static func getIntersecting(hexes: [Hex], ofHex hex: Hex) -> Set<Hex>
	static func getIntersecting(hexes: [Hex], ofHexes hexes: [Hex]) -> Set<Hex>

}


extension HexRange {
	
}
