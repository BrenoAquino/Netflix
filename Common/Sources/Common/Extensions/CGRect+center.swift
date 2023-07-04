//
//  CGRect+center.swift
//  
//
//  Created by Breno Aquino on 23/06/23.
//

import Foundation

public extension CGRect {

    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
