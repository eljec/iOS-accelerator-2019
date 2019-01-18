//
//  MAOInitialViewService.m
//  MyAppOne
//
//  Created by Marcio Mortarino on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewService.h"
#import "MAOInitialViewConstants.h"

@implementation MAOInitialViewService

-(void) fetchItunesDataWithCompletionBlock:(void(^)(NSArray *array, NSError *error)) completionBlock {

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil
                                                                 delegateQueue: [NSOperationQueue mainQueue]];
    NSURL *dataURL = [NSURL URLWithString:ITUNES_DATA_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                NSError *error)
      {
          NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
          completionBlock (dataArray, error);
      }
      ]resume];
}

+(MAOInitialViewService *) sharedInstance {
    static MAOInitialViewService *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MAOInitialViewService alloc] init];
    });
    
    return _sharedInstance;
}

@end
