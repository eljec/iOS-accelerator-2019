//
//  MARequestService.m
//  MyAppOne
//
//  Created by Roman Guarino on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MARequestService.h"

@implementation MARequestService

+(void) fetchDataFromUrl:(NSURL *)url success:(void (^)(NSArray *))onSuccess error:(void (^)(NSError *))onError {
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if(!error) {
                NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                onSuccess(dataArray);
            } else {
                onError(error);
            }
        }];
        [dataTask resume];
    });
}

@end
