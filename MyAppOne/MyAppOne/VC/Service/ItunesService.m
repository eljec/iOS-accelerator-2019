//
//  ItunesService.m
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "ItunesService.h"
#import "ItunesSong.h"
#import "NSString+NSString_UrlEncoding.h"

/**
 Itunes implementation singleton service.
 */
@implementation ItunesService

/**
 Static method to obtain the singleton instance of ItunesService.
 
 @return unique instance
 */
+ (id)instance {
    static ItunesService *itunesServiceInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        itunesServiceInstance = [[self alloc] init];
    });
    return itunesServiceInstance;
}

/**
 Get all songs matched with the query parameter.
 
 @param query NSString
 @return NSArray
 @exception NSException
 */
-(NSArray *) getSongsByQuery:(NSString *) query{
    
    NSString *url = SONGS_URL;
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",url, [query urlencode]]]];
    NSError *error=nil;
    id response=[NSJSONSerialization JSONObjectWithData:data options:
                 NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
        [NSException raise:@"Error on URL Call" format:@"%@", [error localizedDescription]];
    } else {
        
        NSArray *songsJson = [response objectForKey:@"results"];
        
        for(NSDictionary *item in songsJson) {
         [songs addObject:[[ItunesSong alloc] initWithDictionary:item] ];
        }
    }
    return songs;
}

@end
