//
//  Sequence+asyncMap.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import Foundation

public extension Array {

    func asyncCompactMap<Result>(
        _ transform: (Element) async throws -> Result?
    ) async rethrows -> [Result] {
        var transformedArray = [Result]()
        for element in self {
            guard let transformedElement = try await transform(element) else {
                continue
            }
            transformedArray.append(transformedElement)
        }
        return transformedArray
    }
}
