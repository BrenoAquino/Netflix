//
//  ProductionCompany.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Foundation

public struct ProductionCompany: Decodable {

    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}
