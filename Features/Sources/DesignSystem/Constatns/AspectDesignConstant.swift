//
//  AspectDesignConstant.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import Foundation

public enum AspectDesignConstant {

    /// Portrait - Width (2) x Height (3)
    public static let portrait: CGSize = CGSize(width: 2, height: 3)
    /// Landscape - Width (2) x Height (3)
    public static let landscape: CGSize = CGSize(width: 16, height: 9)
}

public extension CGSize {
    var heightDividedByWidth: CGFloat { height / width }
    var widthDividedByHeight: CGFloat { width / height }
}
