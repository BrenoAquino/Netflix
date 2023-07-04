//
//  DetailCoordinator.swift
//  Netflix
//
//  Created by Breno Aquino on 04/07/23.
//

import Detail
import SwiftUI

struct DetailCoordinator: View {

    // MARK: Variables
    
    @ObservedObject var viewModel: DetailCoordinatorViewModel

    // MARK: Inits

    init(viewModel: DetailCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Self View
    
    var body: some View {
        Detail.DetailView(viewModel: viewModel.detailViewModel)
    }
}
