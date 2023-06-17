//
//  CoordinatorFactory.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

class CoordinatorFactory {
    private init() {}

    static func home() -> HomeCoordinator {
        HomeCoordinator(viewModel: ViewModelFactory.homeCoordinator())
    }
}
