//
//  Song.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import Foundation

/**
 DTO protocol for songs
 */
protocol PSSong {
    var artistName: String? { get set }
    var collectionName: String? { get set }
    var trackName: String? { get set }
    var artistViewUrl: String? { get set }
    var collectionViewUrl: String? { get set }
    var trackViewUrl: String? { get set }
    var collectionPrice: Double? { get set }
    var trackPrice: Double? { get set }
    var trackId: Int? {get set}
    var releaseDate: Date? {get set}
    var artworkUrl30: String? {get set}
    var artworkUrl60: String? {get set}
    var artworkUrl100: String? {get set}
}
