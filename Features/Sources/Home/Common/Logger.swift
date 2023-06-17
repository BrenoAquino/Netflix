//
//  Logger.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import Foundation
import Common
import os

class Logger: CommonLogger {
    static var logger: OSLog = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "",
        category: "Features.Home"
    )
}
