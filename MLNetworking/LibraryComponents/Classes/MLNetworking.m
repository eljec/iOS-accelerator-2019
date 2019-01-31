//
//  MLNetworking.m
//  Pods
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//

#import "MLNetworking.h"

@implementation MLNetworking

-(void) fetchUrlWithString:(NSString *)strUrl onSuccess:
(void(^)(NSData *data, NSURLResponse *urlResponse))onSuccess onError:(void(^)(NSError * error)) onError{
    
    // Creo una cola global
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(global, ^{
        
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
        
        
        NSURL *dataURL = [NSURL URLWithString:strUrl];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
        
        
        [[delegateFreeSession dataTaskWithRequest:request
                                completionHandler:^void (NSData *data, NSURLResponse *urlResponse, NSError *error){
                                    
                                    if (!error){
                                        onSuccess(data, urlResponse);
                                    } else {
                                        onError(error);
                                    }
                                    
                                }]resume];
    });
}

-(void)fetchImageFromUrl:(NSString *)url onSuccess:(void (^)(UIImage *))onSuccess{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Obtengo la imagen en bytes
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            onSuccess([UIImage imageWithData:data]);
        });
    });
}


@end
