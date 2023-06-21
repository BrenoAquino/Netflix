//
//  MovieDetail.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Foundation

public struct MovieDetail: Decodable {
    
    let id: Int?
    let imdbID: String?
    let adult: Bool?
    let backgropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let status: String?
    let tagline: String?
    let title: String?
    let voteAverage: Double?
    let voteCount: Int?
}
