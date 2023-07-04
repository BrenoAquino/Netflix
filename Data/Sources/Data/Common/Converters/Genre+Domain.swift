//
//  Genre+Domain.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Domain
import Foundation

extension Genre {
    func convertToDomain() -> Domain.Genre? {
        guard let id, let name else { return nil }
        return Domain.Genre(id: id, title: name)
    }
}
