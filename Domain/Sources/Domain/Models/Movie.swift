//
//  Movie.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public struct Movie {

    public let title: String
    public let poster: String
    public let genresIDs: [Int]
    public let voteAverage: Double
    public var genres: [Genre]

    public init(title: String, poster: String, genresIDs: [Int], voteAverage: Double) {
        self.title = title
        self.poster = poster
        self.genresIDs = genresIDs
        self.voteAverage = voteAverage
        self.genres = []
    }
}
