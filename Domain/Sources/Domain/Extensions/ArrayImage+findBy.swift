//
//  ArrayImage+findBy.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import Foundation

public extension Array where Element == Image {

    func sortedByVoteAverage() -> Self {
        sorted(by: { $0.voteAverage < $1.voteAverage })
    }

    enum AspectRationComparative {
        case closest(aspectRation: Double)
        case highest
        case lowest
    }

    func findBestImage(aspectRationComparative: AspectRationComparative, rangeOffset: Double = 0.1) -> Element? {
        switch aspectRationComparative {
        case .highest:
            return findByCondition {
                $0.aspectRation + rangeOffset < $1.aspectRation
            }
        case .lowest:
            return findByCondition {
                $0.aspectRation - rangeOffset > $1.aspectRation
            }
        case .closest(let aspectRation):
            return findByCondition {
                abs($0.aspectRation - aspectRation) + rangeOffset < abs($1.aspectRation - aspectRation)
            }
        }
    }

    private func findByCondition(
        _ condition: @escaping (_ currentResult: Element, _ element: Element) -> Bool
    ) -> Element? {
        guard var result = first else { return nil }
        for element in self {
            if condition(result, element) {
                result = element
            }
        }
        return result
    }
}
