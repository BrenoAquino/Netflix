//
//  HorizontalList.swift
//  
//
//  Created by Breno Aquino on 17/06/23.
//

import SwiftUI

public struct HorizontalList: View {

    let samples: [String] = [
        "sample 1",
        "sample 2",
        "sample 3",
        "sample 4",
        "sample 5"
    ]

    public var body: some View {
        GeometryReader { gr in
            List {
                ForEach(samples, id: \.hash) {
                    Text($0)
                }
                .rotationEffect(.degrees(90))
            }
            .offset(x: -gr.size.width / 2)
            .rotationEffect(.degrees(-90), anchor: .topLeading)
        }
    }
}

#if DEBUG
struct HorizontalList_Preview: PreviewProvider {

    static var previews: some View {
        HorizontalList()
    }
}
#endif
