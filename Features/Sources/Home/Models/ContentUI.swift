//
//  ContentUI.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

class ContentUI {

    /// Content title
    let title: String
    /// Content categories
    let genres: [GenreUI]
    /// Portrait poster
    let portraitPosterURL: URL

    /// Categories joined
    var genresJoined: String {
        genres.map { $0.name }.joined(separator: " • ")
    }

    init(title: String, genres: [GenreUI], portraitPosterURL: URL) {
        self.title = title
        self.genres = genres
        self.portraitPosterURL = portraitPosterURL
    }

    init(movie: Domain.Movie) {
        title = movie.title
        genres = movie.genres.map { GenreUI(genre: $0) }
        portraitPosterURL = URL(string: "https://image.tmdb.org/t/p/original" + movie.poster)!
    }
}
