//
//  MELINetworking.m
//  pod-networking
//
//  Created by Gonzalo Alexis Quarin on 30/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "MELINetworking.h"

@implementation MELINetworking

- (NSString *) testPOD {
    return @"Hola Mundo!";
}

+ (NSURLCache *)createCache {
    NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/nsurlsessiondemo.cache"];
    NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: 16384
                                                        diskCapacity: 268435456
                                                            diskPath: cachePath];
    return myCache;
}

+ (NSURLSession *)createDelegateFreeSession {
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLCache * myCache = [self createCache];
    
    defaultConfigObject.URLCache = myCache;
    defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil
                                                                 delegateQueue: [NSOperationQueue mainQueue]];
    return delegateFreeSession;
}

static NSURLRequest *createRequest(NSString *url) {
    NSURL *dataURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    return request;
}

+ (void) callRequest: (void(^)(NSData *array)) callback toUrl: (NSString*) url {
    
    NSLog(@"main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    
    [[[self createDelegateFreeSession]
      dataTaskWithRequest:createRequest(url)
      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          callback (data);
      }
      ]resume];
}





































@end
