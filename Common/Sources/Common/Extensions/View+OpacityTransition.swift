//
//  View+OpacityTransition.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import SwiftUI

public extension View {

    func opacityTransition() -> some View {
        transition(.opacity.animation(.linear(duration: 0.3)))
    }
}
