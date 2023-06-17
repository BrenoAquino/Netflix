//
//  Genre.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public struct Genre {

    public let id: Int
    public let title: String

    public init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

// MARK: Hashable

extension Genre: Hashable {}
