//
//  ContentView.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CoordinatorFactory.home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
