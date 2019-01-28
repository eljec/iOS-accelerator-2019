//
//  MAOInitialModel.swift
//  MyAppOneSwift
//
//  Created by Marcio Mortarino on 25/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import Foundation

struct jsonModel : Decodable {
    let resultCount: Int
    let results: [dateFromJson]
}

struct dateFromJson : Decodable {
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let trackId: Int?
    let releaseDate: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let artworkUrl100: String?
}
