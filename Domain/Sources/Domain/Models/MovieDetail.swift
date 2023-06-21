//
//  MovieDetail.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

import Foundation

public struct MovieDetail {

    public let id: Int
    public let title: String
    public let poster: URL
    public let genresIDs: [Int]
    public let voteAverage: Double
    public var genres: [Genre]
    public var images: Images

    public init(
        id: Int,
        title: String,
        poster: URL,
        genresIDs: [Int],
        voteAverage: Double
    ) {
        self.id = id
        self.title = title
        self.poster = poster
        self.genresIDs = genresIDs
        self.voteAverage = voteAverage
        self.genres = []
        self.images = Images(logos: [], posters: [], backdrops: [])
    }

    public init(
        movie: Movie
    ) {
        self.id = movie.id
        self.title = movie.title
        self.poster = movie.poster
        self.genresIDs = movie.genresIDs
        self.voteAverage = movie.voteAverage
        self.genres = movie.genres
        self.images = Images(logos: [], posters: [], backdrops: [])
    }
}
