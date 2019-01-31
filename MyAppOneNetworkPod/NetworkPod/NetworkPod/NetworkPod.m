//
//  NetworkPod.m
//  NetworkPod
//
//  Created by Marcio Mortarino on 30/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import "NetworkPod.h"

@implementation NetworkPod

-(void) requestForUserData:(void(^)(NSData *))completionHandlerSucess with:(void(^)(NSError *))completionHandlerError partOfUrl:(NSString *)partOfUrl{
    NSURL *url =  [NSURL URLWithString:partOfUrl];
    NSURLSessionConfiguration *urlConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:urlConfig
                                                          delegate: nil
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            completionHandlerSucess(data);
        } else {
            completionHandlerError(error);
        }
    }]resume];
}


@end
