//
//  API.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public enum RequestMethod: String {
    case get = "GET"
}

public protocol API {
    /// Base URL
    var domain: DomainConfig { get }
    /// Path to concat with the baseURL
    var path: String { get }
    /// Request verb
    var method: RequestMethod { get }
    /// Headers to send in the request if needed
    var headers: [String : String]? { get }
    /// Query parameter to send in the request if needed
    var queryParams: [String : Any]? { get }
}

extension API {
    var headers: [String : String]? { nil }
    var queryParams: [String : Any]? { nil }
}
