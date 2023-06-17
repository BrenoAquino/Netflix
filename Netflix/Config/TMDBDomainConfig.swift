//
//  TMDBDomainConfig.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Data
import Foundation

struct TMDBConfig: DomainConfig {
    private let apiKey: String = "9fb1244aab053cf93fa00223bef8e80f"
    let baseURL: String = "https://api.themoviedb.org/3"
    var additionalQueryParams: [String : String] {
        ["api_key" : apiKey]
    }
}
