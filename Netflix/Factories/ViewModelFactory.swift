//
//  ViewModelFactory.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation
import Home

class ViewModelFactory {
    private init() {}

    static func home() -> HomeViewModel {
        HomeViewModel(
            carouselsService: ServiceFactory.carousels()
        )
    }

    static func homeCoordinator() -> HomeCoordinatorViewModel {
        HomeCoordinatorViewModel(viewModel: Self.home())
    }
}
