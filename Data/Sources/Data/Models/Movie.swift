//
//  Movie.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

public struct Movie: Decodable {
    
    let posterPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    let genreIDs: [Int]?
    let id: Int?
    let originalTitle: String?
    let originalLanguage: String?
    let title: String?
    let backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case adult, overview, id, title, popularity, video
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIDs = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}

// MARK: Converter

extension Movie {
    func convertToDomain(_ imageDomain: ImageDomainConfig? = nil) -> Domain.Movie? {
        guard
            let id,
            let title,
            let genreIDs,
            let voteAverage,
            let poster = URL(imagePath: posterPath, imageDomain: imageDomain)
        else {
            return nil
        }
        return Domain.Movie(
            id: id,
            title: title,
            poster: poster,
            genresIDs: genreIDs,
            voteAverage: voteAverage
        )
    }
}
