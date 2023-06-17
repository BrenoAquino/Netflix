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
    let contents: [ContentUI]

    init(title: String, contents: [ContentUI]) {
        self.title = title
        self.contents = contents
    }

    init(carousel: Domain.Carousel) {
        title = carousel.title
        contents = carousel.contents.map { ContentUI(movie: $0) }
    }
}
