//
//  Song.swift
//  MyAppOne
//
//  Created by Mayco Martin Barale on 25/01/2019.
//  Copyright © 2019 Mayco Martin Barale. All rights reserved.
//

import Foundation

struct Track: Decodable {
    
    var trackId: Int?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var artworkUrl100: String?
    var trackViewUrl: String?
    var collectionPrice: Float?
    var trackPrice: Float?
    var releaseDate: String?
    var previewUrl: String?
    
    init(dict: Dictionary < String, AnyObject > ) {
        self.trackId = dict["trackId"] as? Int
        self.artistName = dict["artistName"] as? String
        self.collectionName = dict["collectionName"] as? String
        self.trackName = dict["trackName"] as? String
        self.artistViewUrl = dict["artistViewUrl"] as? String
        self.collectionViewUrl = dict["collectionViewUrl"] as? String
        self.artworkUrl100 = dict["artworkUrl100"] as? String
        self.trackViewUrl = dict["trackViewUrl"] as? String
        self.collectionPrice = dict["collectionPrice"] as? Float
        self.trackPrice = dict["trackPrice"] as? Float
        self.releaseDate = dict["releaseDate"] as? String
        self.previewUrl = dict["previewUrl"] as? String
    }
}

struct Songs : Decodable {
    let resultCount: Int
    let results: [Track]
    
}
