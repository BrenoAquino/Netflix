//
//  View+listBackgroundColor.swift
//  
//
//  Created by Breno Aquino on 17/06/23.
//

import SwiftUI

public extension View {

    @ViewBuilder
    func listBackgroundColor(_ view: some View) -> some View {
        if #available(iOS 16, *) {
            scrollContentBackground(.hidden)
                .background(view)
        } else {
            self
        }
    }
}
