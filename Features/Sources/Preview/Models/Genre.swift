//
//  File.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

#if DEBUG
import Domain
import Foundation

extension Domain.Genre {
    public static let animation: Genre = .init(id: 0, title: "Animation")
    public static let adventure: Genre = .init(id: 1, title: "Adventure")
    public static let family: Genre = .init(id: 2, title: "Family")
    public static let fantasy: Genre = .init(id: 3, title: "Fantasy")
}

#endif
