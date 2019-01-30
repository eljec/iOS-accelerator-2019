//
//  PSSongService.h
//  PSSongApi
//
//  Created by VICTOR ABEL CABEZA on 30/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSSong.h"

typedef NS_ENUM(NSUInteger, PSSongOrderBy) {
    trackName,
    releaseDate,
    trackId
};

@protocol PSSongService <NSObject>
-(void) getSongsByQuery:(NSString *) query andOrderBy:(PSSongOrderBy) orderBy andAsc: (BOOL) asc andCompletition:(void(^)(NSArray<PSSong> *songsArray)) completion andError:(void(^)(NSError *error)) errorCompletition;

@end
