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

extension Genre {
    func convertToDomain() -> Domain.Genre {
        Domain.Genre(
            id: id ?? .zero,
            title: name ?? ""
        )
    }
}
