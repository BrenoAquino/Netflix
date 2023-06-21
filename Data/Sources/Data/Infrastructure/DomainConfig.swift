//
//  File.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol DomainConfig {
    /// Base URL
    var baseURL: String { get }
    /// Required query parameters to add in all requests
    var standardsQueryParams: [String : Any] { get }
    /// Required headers to add in all requests
    var standardsHeaders: [String : String] { get }
}

public protocol ImageDomainConfig {
    /// Image pre processing
    func preProcessing(_ imagePath: String?) -> String?
}

public extension DomainConfig {
    var standardsQueryParams: [String : Any] { [:] }
    var standardsHeaders: [String : String] { [:] }
    func preImageProcessing(_ imagePath: String) -> String { imagePath }
}
