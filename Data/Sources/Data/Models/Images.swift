//
//  Images.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

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
