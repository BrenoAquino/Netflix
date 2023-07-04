//
//  DetailCoordinatorViewModel.swift
//  Netflix
//
//  Created by Breno Aquino on 04/07/23.
//

import Foundation
import Detail

class DetailCoordinatorViewModel: ObservableObject {

    // MARK: Variables

    let detailViewModel: Detail.DetailViewModel

    // MARK: Inits

    init(viewModel: Detail.DetailViewModel) {
        detailViewModel = viewModel
    }
}

