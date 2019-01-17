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
 Obtain the songs by query string.
 
 @param query the query string
 @param completionBlock what I execute on completition
 */
-(void) songsByQuery:(NSString *) query andCompletitionBlock:(void(^)(NSArray *songsArray, NSError *error)) completionBlock{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/nsurlsessionsongs.cache"];
    
    NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: 16384
                                                        diskCapacity: 268435456
                                                            diskPath: cachePath];
    defaultConfigObject.URLCache = myCache;
    
    defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil
                                                                 delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",SONGS_URL, [query urlencode]];
    
    NSURL *dataURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                NSError *error)
      {
          
          NSMutableArray *songsArray = [[NSMutableArray alloc] init];
          if (!error) {
              id responseSerialized=[NSJSONSerialization JSONObjectWithData:data options:
                                     NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
              NSArray *songsJson = [responseSerialized objectForKey:@"results"];
              
              for(NSDictionary *item in songsJson) {
                  [songsArray addObject:[[ItunesSong alloc] initWithDictionary:item] ];
              }
          }
          completionBlock (songsArray, error);
      }
      ]resume];
}

@end
