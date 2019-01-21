//
//  MLServiceHelper.m
//  MyAppOne
//
//  Created by Gonzalo Alexis Quarin on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MLServiceHelper.h"

@implementation MLServiceHelper

+(instancetype) instance
{
    static MLServiceHelper *_isntance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _isntance = [[MLServiceHelper alloc] init];
    });
    
    return _isntance;
}

-  (void) callRequest: (void(^)(NSArray *array, NSError *error)) callback toUrl: (NSString*) url {
    
    NSLog(@"main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    
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
    
    NSURL *dataURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    
    [[delegateFreeSession
      dataTaskWithRequest:request
      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
//          NSLog(@"RESPONSE %@ - ERROR: %@.\n", response, error);
          NSArray *dataArray = [NSJSONSerialization
                                     JSONObjectWithData:data
                                     options: NSJSONReadingMutableContainers
                                     error:&error];
          
//          NSLog(@"DATA RESPONSE: %@", dataArray);
          callback (dataArray, error);
      }
      ]resume];
}


@end
