//
//  PSItunesSongService.m
//  PSSongApi
//
//  Created by VICTOR ABEL CABEZA on 30/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//
#import "PSItunesSongService.h"
#import "NSString+NSString_UrlEncoding.h"
#import "PSItunesSong.h"
#import "PSSong.h"

@implementation PSItunesSongService
-(void) getSongsByQuery:(NSString *) query andOrderBy:(PSSongOrderBy) orderBy andAsc: (BOOL) asc andCompletition:(void(^)(NSArray<PSSong> *songsArray)) completion andError:(void(^)(NSError *error)) errorCompletition{
    
    NSString *targetUrl = [NSString stringWithFormat:@"%@%@",SONGS_URL, [query urlencode]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:targetUrl]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          NSMutableArray<PSSong> *songsArray = [NSMutableArray<PSSong> new];
                    if (!error) {
                        id responseSerialized=[NSJSONSerialization JSONObjectWithData:data options:
                                            NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
                        NSArray *songsJson = [responseSerialized objectForKey:@"results"];
          
                       for(NSDictionary *item in songsJson) {
                            [songsArray addObject:[[PSItunesSong alloc] initWithDictionary:item] ];
                        }
                        NSArray<PSSong> *songsSorted = [self orderArray:songsArray andOrderBy:orderBy andAsc:asc];
                        completion(songsSorted);
                    } else {
                        errorCompletition(error);
                    }
      }] resume];
}

- (NSArray<PSSong> *)orderArray:(NSArray<PSSong> *)songsArray andOrderBy:(PSSongOrderBy) orderBy andAsc:(BOOL) ascending {
    
    NSSortDescriptor *sortDescriptor = nil;
    switch (orderBy) {
        case trackName:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"trackName" ascending:ascending];
            break;
        case releaseDate:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"releaseDate" ascending:ascending];
            break;
        case trackId:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"trackId" ascending:ascending];
            break;
        default:
            break;
    }
    return [songsArray sortedArrayUsingDescriptors:@[sortDescriptor]];
}

@end
