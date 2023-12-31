//
//  CarouselsServicesMock.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

#if DEBUG
import Domain
import Foundation

public class CarouselsServicesMock: Domain.CarouselsService {
    public init() {}

    public func highlighted() async throws -> [MovieDetail] {
        [.marioBros, .marioBros]
    }

    public func topRated() async throws -> [Domain.Movie] {
        [.marioBros, .marioBros, .marioBros, .marioBros, .marioBros, .marioBros, .marioBros, .marioBros]
    }

    public func upcoming() async throws -> [Domain.Movie] {
        [.marioBros, .marioBros, .marioBros, .marioBros, .marioBros]
    }

    public func popular() async throws -> [Domain.Movie] {
        [.marioBros, .marioBros]
    }
}

#endif
