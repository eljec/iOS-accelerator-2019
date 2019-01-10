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
 Get all songs matched with the query parameter.

 @param query NSString
 @return NSArray
 */
-(NSArray *) getSongsByQuery:(NSString *) query;

@end

