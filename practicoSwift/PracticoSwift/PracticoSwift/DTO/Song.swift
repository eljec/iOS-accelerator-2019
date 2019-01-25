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
protocol Song {
    var artistName: String? { get set }
    var collectionName: String? { get set }
    var trackName: String? { get set }
    var artistViewUrl: String? { get set }
    var collectionViewUrl: String? { get set }
    var trackViewUrl: String? { get set }
    var collectionPrice: Double? { get set }
    var trackPrice: Double? { get set }
}
