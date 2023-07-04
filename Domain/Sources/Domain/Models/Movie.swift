//
//  Movie.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public struct Movie {

    public let id: Int
    public let title: String
    public let poster: URL?
    public let genresIDs: [Int]
    public let voteAverage: Double
    public var genres: [Genre]

    public init(
        id: Int,
        title: String,
        poster: URL?,
        genresIDs: [Int],
        voteAverage: Double
    ) {
        self.id = id
        self.title = title
        self.poster = poster
        self.genresIDs = genresIDs
        self.voteAverage = voteAverage
        self.genres = []
    }
}
