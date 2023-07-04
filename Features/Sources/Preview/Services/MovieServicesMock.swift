//
//  MovieServicesMock.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

#if DEBUG
import Domain
import Foundation

public class MovieServicesMock: Domain.MovieService {
    public init() {}

    public func cleanImages(movieID: Int) async throws -> Images {
        Domain.MovieDetail.spiderMan.cleanImages
    }

    public func images(movieID: Int) async throws -> Images {
        Domain.MovieDetail.spiderMan.images
    }

    public func detail(movieID: Int) async throws -> MovieDetail {
        Domain.MovieDetail.spiderMan
    }

    public func allContent(movieID: Int) async throws -> MovieDetail {
        Domain.MovieDetail.spiderMan
    }
}
#endif
