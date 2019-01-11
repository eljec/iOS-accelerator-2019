//
//  ItunesSong.m
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "ItunesSong.h"

/**
 DTO implementation for Itunes songs list
 */
@implementation ItunesSong

// MARK: Properties

@synthesize wrapperType;
@synthesize kind;
@synthesize artistId;
@synthesize collectionId;
@synthesize trackId;
@synthesize artistName;
@synthesize collectionName;
@synthesize trackName;
@synthesize collectionCensoredName;
@synthesize trackCensoredName;
@synthesize artistViewUrl;
@synthesize collectionViewUrl;
@synthesize trackViewUrl;
@synthesize previewUrl;
@synthesize artworkUrl30;
@synthesize artworkUrl60;
@synthesize artworkUrl100;
@synthesize collectionPrice;
@synthesize trackPrice;
@synthesize collectionExplicitness;
@synthesize trackExplicitness;
@synthesize discCount;
@synthesize discNumber;
@synthesize trackCount;
@synthesize trackNumber;
@synthesize trackTimeMillis;
@synthesize country;
@synthesize currency;
@synthesize primaryGenreName;
@synthesize isStreamable;
@synthesize collectionArtistId;
@synthesize collectionArtistName;
@synthesize collectionArtistViewUrl;
@synthesize trackRentalPrice;
@synthesize trackHdPrice;
@synthesize contentAdvisoryRating;
@synthesize trackHdRentalPrice;
@synthesize longDescription;
@synthesize collectionHdPrice;
@synthesize shortDescription;
@synthesize hasITunesExtras;
@synthesize feedUrl;
@synthesize copyright;
@synthesize description;

// MARK: Methods

/**
 Initialize Itunes Song with parameter.
 
 @param JSONDictionary NSDictionary
 @return instancetype
 */
- (instancetype)initWithDictionary:(NSDictionary *)JSONDictionary{
    self = [super init];
    if (self) {
    
        if (JSONDictionary) {
            [self setValuesForKeysWithDictionary:JSONDictionary];
        }
    }
    return self;
}

- (void) setReleaseDate:(NSDate *)releaseDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:00Z";
    NSDate* date = [dateFormatter dateFromString: releaseDate];
     _releaseDate = date;
}

- (NSComparisonResult)compareByTrackName:(ItunesSong *)otherSong {
    if(otherSong && otherSong.trackName){
        return [self.trackName compare:otherSong.trackName];
    }
    return NSOrderedDescending;
}

- (NSComparisonResult)compareByTrackId:(ItunesSong *)otherSong {
    if(otherSong && otherSong.trackId){
        return [self.trackId compare:otherSong.trackId];
    }
    return NSOrderedDescending;
}

- (NSComparisonResult)compareByReleaseDate:(ItunesSong *)otherSong {
    if(otherSong && otherSong.releaseDate){
        return [self.releaseDate compare:otherSong.releaseDate];
    }
    return NSOrderedDescending;
}

@end
