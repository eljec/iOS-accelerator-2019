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

+(MARequestService *) sharedInstance
{
    static MARequestService *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MARequestService alloc] init];
    });
    return _sharedInstance;
}

-(void) fetchData:(void (^)(NSArray *, NSError *))completionBlock fromString:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    [self fetchData:^(NSArray *dataArray, NSError *error) {
        completionBlock(dataArray, error);
    } fromURL:url];
}

-(void) fetchData:(void (^)(NSArray *, NSError *))completionBlock fromURL:(NSURL *)url {
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completionBlock (dataArray, error);
    }];
    [dataTask resume];
}

@end
