//
//  ItunesSong.h
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 DTO interface for Itunes songs list
 */
@interface ItunesSong : NSObject

// MARK: properties

@property NSString *wrapperType;
@property NSString *kind;
@property NSNumber *artistId;
@property NSNumber *collectionId;
@property NSNumber *trackId;
@property NSString *artistName;
@property NSString *collectionName;
@property NSString *trackName;
@property NSString *collectionCensoredName;
@property NSString *trackCensoredName;
@property NSString *artistViewUrl;
@property NSString *collectionViewUrl;
@property NSString *trackViewUrl;
@property NSString *previewUrl;
@property NSString *artworkUrl30;
@property NSString *artworkUrl60;
@property NSString *artworkUrl100;
@property NSNumber *collectionPrice;
@property NSNumber *trackPrice;
@property (nonatomic, readonly, copy)NSDate *releaseDate;
@property NSString *collectionExplicitness;
@property NSString *trackExplicitness;
@property NSNumber *discCount;
@property NSNumber *discNumber;
@property NSNumber *trackCount;
@property NSNumber *trackNumber;
@property NSNumber *trackTimeMillis;
@property NSString *country;
@property NSString *currency;
@property NSString *primaryGenreName;
@property BOOL isStreamable;
@property NSNumber *collectionArtistId;
@property NSString *collectionArtistName;
@property NSString *collectionArtistViewUrl;
@property NSNumber *trackRentalPrice;
@property NSNumber *trackHdPrice;
@property NSNumber *contentAdvisoryRating;
@property NSNumber *trackHdRentalPrice;
@property NSString *longDescription;
@property NSString *collectionHdPrice;
@property NSString *shortDescription;
@property BOOL hasITunesExtras;
@property NSString *feedUrl;
@property NSString *copyright;
@property NSString *description;

// MARK: methods

/**
 Initialize Itunes Song with parameter.

 @param JSONDictionary NSDictionary
 @return instancetype
 */
- (instancetype)initWithDictionary:(NSDictionary *)JSONDictionary;

@end
