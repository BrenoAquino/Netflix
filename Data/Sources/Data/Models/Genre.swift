//
//  File.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

public struct Genre: Decodable {

    let id: Int?
    let name: String?
}

// MARK: Converter

extension Genre {
    func convertToDomain() -> Domain.Genre? {
        guard let id, let name else { return nil }
        return Domain.Genre(id: id, title: name)
    }
}
