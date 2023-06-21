//
//  Images.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

import Domain
import Foundation

public struct Image: Decodable {

    let aspectRation: Double?
    let height: Int?
    let iso6391: String?
    let imagePath: String?
    let voteAverage: Double?
    let voteCount: Int?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height, width
        case aspectRation = "aspect_ratio"
        case iso6391 = "iso_639_1"
        case imagePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

public struct Images: Decodable {

    let id: Int?
    let logos: [Image]?
    let posters: [Image]?
    let backdrops: [Image]?
}

// MARK: Converter

extension Image {
    func convertToDomain(_ imageDomain: ImageDomainConfig? = nil) -> Domain.Image? {
        guard
            let aspectRation,
            let image = URL(imagePath: imagePath, imageDomain: imageDomain)
        else {
            return nil
        }
        return Domain.Image(aspectRation: aspectRation, image: image)
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
