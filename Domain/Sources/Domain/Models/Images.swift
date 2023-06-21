//
//  Images.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

import Foundation

public struct Image {

    public let aspectRation: Double
    public let image: URL

    public init(aspectRation: Double, image: URL) {
        self.aspectRation = aspectRation
        self.image = image
    }
}

public struct Images {

    public let logos: [Image]
    public let posters: [Image]
    public let backdrops: [Image]

    public init(logos: [Image], posters: [Image], backdrops: [Image]) {
        self.logos = logos
        self.posters = posters
        self.backdrops = backdrops
    }
}
