//
//  CachedAsyncImage.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import Foundation
import SwiftUI

private class ImageCacheManager {
    private init() {}
    static var images: [URL: Image] = [:]
}

public struct CachedAsyncImage<Content: View, Placeholder: View>: View {

    private let url: URL?
    @ViewBuilder private let content: (Image) -> Content
    @ViewBuilder private let placeholder: () -> Placeholder

    public var body: some View {
        if let url, let image = ImageCacheManager.images[url] {
            content(image)
        } else {
            AsyncImage(url: url) { imagePhase in
                switch imagePhase {
                case .success(let image):
                    contentHandler(image)
                case .failure, .empty:
                    placeholder()
                @unknown default:
                    fatalError()
                }
            }
        }
    }

    private func contentHandler(_ image: Image) -> some View {
        if let url {
            ImageCacheManager.images[url] = image
        }
        return content(image)
    }
}
