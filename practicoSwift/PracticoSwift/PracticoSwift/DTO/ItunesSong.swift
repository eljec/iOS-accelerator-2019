//
//  ItunesSong.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import Foundation

/**
 DTO implementation for Itunes songs list
 */
class ItunesSong : Song {
    
    // MARK: Properties
    
    var wrapperType:String?
    var kind:String?
    var artistId:Int?
    var collectionId:Int?
    var trackId:Int?
    var artistName:String?
    var collectionName:String?
    var trackName:String?
    var collectionCensoredName:String?
    var trackCensoredName:String?
    var artistViewUrl:String?
    var collectionViewUrl:String?
    var trackViewUrl:String?
    var previewUrl:String?
    var artworkUrl30:String?
    var artworkUrl60:String?
    var artworkUrl100:String?
    var collectionPrice:Double?
    var trackPrice:Double?
    var releaseDate:String?
    var collectionExplicitness:String?
    var trackExplicitness:String?
    var discCount:Int?
    var discNumber:Int?
    var trackCount:Int?
    var trackNumber:Int?
    var trackTimeMillis:Int?
    var country:String?
    var currency:String?
    var primaryGenreName:String?
    var isStreamable:Bool?
    var collectionArtistId:Int?
    var collectionArtistName:String?
    var collectionArtistViewUrl:String?
    var trackRentalPrice:Double?
    var trackHdPrice:Double?
    var contentAdvisoryRating:Int?
    var trackHdRentalPrice:Double?
    var longDescription:String?
    var collectionHdPrice:Double?
    var shortDescription:String?
    var hasITunesExtras:Bool?
    var feedUrl:String?
    var copyright:String?
    
    init?(dictionary: [String: AnyObject]) {
        wrapperType = dictionary["wrapperType"] as? String
        kind = dictionary["kind"] as? String
        artistId = dictionary["artistId"] as? Int
        collectionId = dictionary["collectionId"] as? Int
        trackId = dictionary["trackId"] as? Int
        artistName = dictionary["artistName"] as? String
        collectionName = dictionary["collectionName"] as? String
        trackName = dictionary["trackName"] as? String
        collectionCensoredName = dictionary["collectionCensoredName"] as? String
        trackCensoredName = dictionary["trackCensoredName"] as? String
        artistViewUrl = dictionary["artistViewUrl"] as? String
        collectionViewUrl = dictionary["collectionViewUrl"] as? String
        trackViewUrl = dictionary["trackViewUrl"] as? String
        previewUrl = dictionary["previewUrl"] as? String
        artworkUrl30 = dictionary["artworkUrl30"] as? String
        artworkUrl60 = dictionary["artworkUrl60"] as? String
        artworkUrl100 = dictionary["artworkUrl100"] as? String
        collectionPrice = dictionary["collectionPrice"] as? Double
        trackPrice = dictionary["trackPrice"] as? Double
        releaseDate = dictionary["releaseDate"] as? String
        collectionExplicitness = dictionary["collectionExplicitness"] as? String
        trackExplicitness = dictionary["trackExplicitness"] as? String
        discCount = dictionary["discCount"] as? Int
        discNumber = dictionary["discNumber"] as? Int
        trackCount = dictionary["trackCount"] as? Int
        trackNumber = dictionary["trackNumber"] as? Int
        trackTimeMillis = dictionary["trackTimeMillis"] as? Int
        country = dictionary["country"] as? String
        currency = dictionary["currency"] as? String
        primaryGenreName = dictionary["primaryGenreName"] as? String
        isStreamable = dictionary["isStreamable"] as? Bool
        collectionArtistId = dictionary["collectionArtistId"] as? Int
        collectionArtistName = dictionary["collectionArtistName"] as? String
        collectionArtistViewUrl = dictionary["collectionArtistViewUrl"] as? String
        trackRentalPrice = dictionary["trackRentalPrice"] as? Double
        trackHdPrice = dictionary["trackHdPrice"] as? Double
        contentAdvisoryRating = dictionary["contentAdvisoryRating"] as? Int
        trackHdRentalPrice = dictionary["trackHdRentalPrice"] as? Double
        longDescription = dictionary["longDescription"] as? String
        collectionHdPrice = dictionary["collectionHdPrice"] as? Double
        shortDescription = dictionary["shortDescription"] as? String
        hasITunesExtras = dictionary["hasITunesExtras"] as? Bool
        feedUrl = dictionary["feedUrl"] as? String
        copyright = dictionary["copyright"] as? String
        
    }
}
