//
//  MLNetworking.m
//  Pods
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//

#import "MLNetworking.h"
#define MIN_MEMORY_CACHE 16384
#define MAX_MEMORY_CACHE 268435456

@interface MLNetworking()
@end

@implementation MLNetworking

typedef void (^CompletionHandler)(NSData *, NSURLResponse *, NSError *);

-(void) fetchUrlWithString:(NSString *)strUrl onSuccess:
(SuccessRequest)onSuccess onError:(ErrorRequest) onError{
    
    // Creo una cola global
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(global, ^{
        
        NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/mlnetworking.cache"];
        
        NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: MIN_MEMORY_CACHE
                                                            diskCapacity: MAX_MEMORY_CACHE
                                                                diskPath: cachePath];
        
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        defaultConfigObject.URLCache = myCache;
        defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        
        NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                          delegate: nil
                                                                     delegateQueue: [NSOperationQueue mainQueue]];
        
        
        
        NSURL *dataURL = [NSURL URLWithString:strUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
        
        CompletionHandler completionHandler = ^void (NSData *data, NSURLResponse *urlResponse, NSError *error){
            
            if (!error){
                onSuccess(data, urlResponse);
            } else {
                onError(error);
            }
        };
        
        [[delegateFreeSession dataTaskWithRequest:request
                                completionHandler:completionHandler]resume];
    });
}
@end
