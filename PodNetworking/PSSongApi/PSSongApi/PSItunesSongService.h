//
//  PSItunesSongService.h
//  PSSongApi
//
//  Created by VICTOR ABEL CABEZA on 30/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSSongService.h"

/**
 URL definition to get songs urls.
 */
#define SONGS_URL @"https://itunes.apple.com/search?term="

@interface PSItunesSongService : NSObject <PSSongService>
-(void) getSongsByQuery:(NSString *) query andOrderBy:(PSSongOrderBy) orderBy andAsc: (BOOL) asc andCompletition:(void(^)(NSArray<PSSong> *songsArray)) completion andError:(void(^)(NSError *error)) errorCompletition;
@end
