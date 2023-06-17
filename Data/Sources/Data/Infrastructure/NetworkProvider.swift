//
//  NetworkProvider.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol NetworkProvider {
    func execute<Model: Decodable>(endpoint: API, keyPath: String?) async throws -> Model
}
