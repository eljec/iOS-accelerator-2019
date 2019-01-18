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
    // set the correct URL for tests
    NSString *wrongURL = @"https://itunes.apple.com/searchx?term=the+beatles";
    NSString *successURL = @"https://itunes.apple.com/search?term=the+beatles";
    
    /*
     Configuration object for NSURLSession
     With defaultSessionConfiguration, we can configure the session quickly
     */
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    /*
     NSTemporaryDirectory, return the temporary directory dfor the current user
     stringByAppendingPathComponent, append string to exist string
     */
    NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/nsurlsessiondemo.cache"];
    /*
     NSURLCache, maps the URL request in NSCachedURLResponse, all values of init are in bytes
     */
    
    NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: 16384
                                                        diskCapacity: 268435456
                                                            diskPath: cachePath];
    defaultConfigObject.URLCache = myCache;
    defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    
    /*
     NSURLSession, manage data to diferents endpoints. In this case with specific session configuration.
     */
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil
                                                                 delegateQueue: [NSOperationQueue mainQueue]];
    NSURL *dataURL = [NSURL URLWithString:wrongURL];
    /*
     NSURLRequest, create a URL request for specific URL, in this case with above URL
     */
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            /*
             NSJSONSerialization, convert JSON to Foundation objects and inverse.
                JSONObjectWithData, return a object from JSON
             */
            NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completionBlock (dataArray, error);
    }]resume];
}

@end
