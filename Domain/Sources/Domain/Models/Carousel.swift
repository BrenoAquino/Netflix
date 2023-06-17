//
//  Carousel.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public struct Carousel {

    public let title: String
    public let contents: [Movie]

    public init(title: String, contents: [Movie]) {
        self.title = title
        self.contents = contents
    }
}
