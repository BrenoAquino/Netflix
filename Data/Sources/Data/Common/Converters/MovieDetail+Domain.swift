//
//  MovieDetail+Domain.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Domain
import Foundation

extension MovieDetail {
    func convertToDomain(_ imageDomain: ImageDomainConfig? = nil) -> Domain.MovieDetail? {
        guard
            let id,
            let title,
            let voteAverage,
            let genres,
            let poster = URL(imagePath: posterPath, imageDomain: imageDomain)
        else {
            return nil
        }
        return Domain.MovieDetail(
            id: id,
            title: title,
            poster: poster,
            voteAverage: voteAverage,
            genres: genres.compactMap { $0.convertToDomain() }
        )
    }
}
