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
    public let voteAverage: Double
    public var genres: [Genre]
    public var images: Images
    public var cleanImages: Images

    public init(
        id: Int,
        title: String,
        voteAverage: Double,
        genres: [Genre],
        images: Images = Images(logos: [], posters: [], backdrops: []),
        cleanImages: Images = Images(logos: [], posters: [], backdrops: [])
    ) {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.genres = genres
        self.images = images
        self.cleanImages = cleanImages
    }

    public init(
        movie: Movie,
        images: Images = Images(logos: [], posters: [], backdrops: []),
        cleanImages: Images = Images(logos: [], posters: [], backdrops: [])
    ) {
        self.id = movie.id
        self.title = movie.title
        self.voteAverage = movie.voteAverage
        self.genres = movie.genres
        self.images = images
        self.cleanImages = cleanImages
    }
}
