//
//  CarouselUI.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

class CarouselUI {

    /// Carousel title
    let title: String
    /// Carousel's content
    let movies: [MovieUI]

    init(title: String, movies: [MovieUI]) {
        self.title = title
        self.movies = movies
    }
}

extension CarouselUI: Identifiable {
    var id: String { title }
}
