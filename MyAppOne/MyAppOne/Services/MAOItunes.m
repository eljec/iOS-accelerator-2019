//
//  MAOItunes.m
//  MyAppOne
//
//  Created by Metricas on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOItunes.h"

@implementation MAOItunes

+(MAOItunes *) sharedInstance
{
    static MAOItunes *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MAOItunes alloc] init];
    });
    return _sharedInstance;
}

-(void) fetchItunesDataWithCompletionBlock:(void(^)(NSArray *infoArray, NSError *error))completionBlock;
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/nsurlsessiondemo.cache"];
    NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: 16384
                                                        diskCapacity: 268435456
                                                            diskPath: cachePath];
    defaultConfigObject.URLCache = myCache;
    defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil
                                                                 delegateQueue: [NSOperationQueue mainQueue]];
    NSURL *dataURL = [NSURL URLWithString:@"https://itunes.apple.com/search?term=metallica"];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            //NSLog(@"Got response %@ with error %@.\n", response, error);
            NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completionBlock (dataArray, error);
    }]resume];
}

@end
