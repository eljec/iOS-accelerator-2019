//
//  PSong.h
//  PSSongApi
//
//  Created by VICTOR ABEL CABEZA on 30/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSSong <NSObject>

@required
@property (nonatomic, retain) id anObject;
@property NSString *artistName;
@property NSString *collectionName;
@property NSString *trackName;
@property NSString *artistViewUrl;
@property NSString *collectionViewUrl;
@property NSString *trackViewUrl;
@property NSNumber *collectionPrice;
@property NSNumber *trackPrice;
@property NSNumber *trackId;
@property NSDate *releaseDate;
@property NSString *artworkUrl30;
@property NSString *artworkUrl60;
@property NSString *artworkUrl100;
@end

