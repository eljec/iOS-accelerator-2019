//
//  IOAModel.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 25/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import Foundation

struct IOAModel: Decodable {
    let resultCount: Int
    let results: [Track]
}

struct Track: Decodable {
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let releaseDate: String?
    let artworkUrl100: String?
    let collectionPrice: Float?
    let trackPrice: Float?
}
