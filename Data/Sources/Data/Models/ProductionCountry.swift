//
//  ProductionCountry.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Foundation

public struct ProductionCountry: Decodable {
    
    let iso31661: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case name
        case iso31661 = "iso_3166_1"
    }
}
