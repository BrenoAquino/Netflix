//
//  GenreUI.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

class GenreUI {

    /// Category name
    let name: String

    init(name: String) {
        self.name = name
    }

    init(genre: Genre) {
        name = genre.title
    }
}

extension GenreUI: Identifiable {
    var id: String { name }
}
