//
//  Movie+Domain.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Domain
import Foundation

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
