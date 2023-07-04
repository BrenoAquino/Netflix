//
//  File.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

import Foundation

extension URL {

    init?(imagePath: String?, imageDomain: ImageDomainConfig?) {
        guard let string = imageDomain?.preProcessing(imagePath) ?? imagePath else {
            return nil
        }
        self.init(string: string)
    }
}
