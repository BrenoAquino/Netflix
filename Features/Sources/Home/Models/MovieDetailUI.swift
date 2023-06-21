//
//  MovieDetailUI.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

import Domain
import Foundation

class MovieDetailUI {

    /// Content title
    let title: String
    /// Content categories
    let genres: [GenreUI]
    /// Portrait poster
    let posterURL: URL
    /// Backdrop image
    let backdropURL: URL
    /// Logo image
    let logoURL: URL

    /// Categories joined
    var genresJoined: String {
        genres.map { $0.name }.joined(separator: " • ")
    }

    init(title: String, genres: [GenreUI], posterURL: URL, backdropURL: URL, logoURL: URL) {
        self.title = title
        self.genres = genres
        self.posterURL = posterURL
        self.backdropURL = backdropURL
        self.logoURL = logoURL
    }

    init(movie: Domain.MovieDetail) {
        title = movie.title
        genres = movie.genres.map { GenreUI(genre: $0) }
        posterURL = movie.images.posters.first!.image
        backdropURL = movie.images.backdrops.first!.image
        logoURL = movie.images.logos.highestAspect()!.image
    }
}

private extension Array where Element == Image {

    func highestAspect() -> Element? {
        guard var element = first else { return nil }
        for elem in self {
            if element.aspectRation < elem.aspectRation {
                element = elem
            }
        }
        return element
    }
}
