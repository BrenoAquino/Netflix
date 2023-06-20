//
//  NetflixApp.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import SwiftUI

@main
struct NetflixApp: App {

    init() {
        setupURLCacheSize()
        setupTableViewAppearance()
        setupScrollViewAppearance()
        setupNavigationBarAppearance()
    }

    // MARK: Setups

    func setupURLCacheSize() {
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 10 * 1024 * 1024 * 1024
        let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
        URLCache.shared = cache
    }

    func setupTableViewAppearance() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    func setupScrollViewAppearance() {
        UIScrollView.appearance().showsVerticalScrollIndicator = false
        UIScrollView.appearance().showsHorizontalScrollIndicator = false
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }

    func setupNavigationBarAppearance() {
        UINavigationBar.appearance().tintColor = .white
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
