#import <Foundation/Foundation.h>
#import "RGNetworking.h"

@implementation RGNetworking
    
+(void) fetchDataFromUrl:(NSURL *)url success:(void (^)(NSData *))onSuccess error:(void (^)(NSError *))onError {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        [[defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if(!error) {
                onSuccess(data);
            } else {
                onError(error);
            }
        }] resume];
    });
}
    
@end
