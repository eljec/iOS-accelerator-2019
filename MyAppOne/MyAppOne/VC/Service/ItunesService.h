//
//  ItunesService.h
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
URL definition to get songs urls.
 */
#define SONGS_URL @"https://itunes.apple.com/search?term="

/**
 Itunes interface singleton service.
 */
@interface ItunesService : NSObject


/**
 Static method to obtain the singleton instance of ItunesService.

 @return unique instance
 */
+(id)instance;

/**
 Obtain the songs by query string.

 @param query the query string
 @param completionBlock what I execute on completition
 */
-(void) getSongsByQuery:(NSString *) query andCompletitionBlock:(void(^)(NSArray *songsArray, NSError *error)) completionBlock;

@end

