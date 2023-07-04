//
//  Logger.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import Foundation
import Common
import os

class Logger: CommonLogger {
    static var logger: OSLog = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "",
        category: "Features.Detail"
    )
}
