//
//  NFButton.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import SwiftUI

public struct NFButtonStyle: ButtonStyle {

    private let backgroundColor: Color

    public init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(
                backgroundColor
                    .opacity(0.7)
                    .background(.ultraThinMaterial)
            )
            .cornerRadius(8)
    }
}

struct NFButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Button("Example", action: {})
            .buttonStyle(NFButtonStyle(backgroundColor: .black))

        Button(action: {}) {
            HStack {
                Image(systemName: "play.fill")
                Text("Play")
            }
        }
        .buttonStyle(NFButtonStyle(backgroundColor: .black))
    }
}
