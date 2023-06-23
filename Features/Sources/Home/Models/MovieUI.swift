//
//  MovieUI.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

class MovieUI {

    /// ID
    let id: Int
    /// Content title
    let title: String
    /// Content categories
    let genres: [GenreUI]
    /// Portrait poster
    let posterURL: URL?

    /// Categories joined
    var genresJoined: String {
        genres.map { $0.name }.joined(separator: " • ")
    }

    init(id: Int, title: String, genres: [GenreUI], posterURL: URL?) {
        self.id = id
        self.title = title
        self.genres = genres
        self.posterURL = posterURL
    }

    init(movie: Domain.Movie) {
        id = movie.id
        title = movie.title
        genres = movie.genres.map { GenreUI(genre: $0) }
        posterURL = movie.poster
    }
}

extension MovieUI: Identifiable {}
