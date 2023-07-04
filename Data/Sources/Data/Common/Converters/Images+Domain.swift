//
//  Image+Domain.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Domain
import Foundation

extension Image {
    func convertToDomain(_ imageDomain: ImageDomainConfig? = nil) -> Domain.Image? {
        guard
            let aspectRation,
            let voteAverage,
            let image = URL(imagePath: imagePath, imageDomain: imageDomain)
        else {
            return nil
        }
        return Domain.Image(aspectRation: aspectRation, image: image, voteAverage: voteAverage)
    }
}

extension Images {
    func convertToDomain(_ imageDomain: ImageDomainConfig? = nil) -> Domain.Images {
        let logos = logos?.compactMap { $0.convertToDomain(imageDomain) } ?? []
        let posters = posters?.compactMap { $0.convertToDomain(imageDomain) } ?? []
        let backdrops = backdrops?.compactMap { $0.convertToDomain(imageDomain) } ?? []
        return Domain.Images(logos: logos, posters: posters, backdrops: backdrops)
    }
}
