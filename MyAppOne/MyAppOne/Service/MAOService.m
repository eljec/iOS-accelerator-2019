//
//  MAOService.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOService.h"

@implementation MAOService
+(MAOService *) sharedInstance
{
    static MAOService *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MAOService alloc] init];
    });
    
    return _sharedInstance;
}

- (void)fetchJsonWithCompletionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completionBlock url:(NSString *)url{
    
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
    
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:completionBlock]resume];
}

- (NSArray<MAOListViewControllerModel *> *) parserJson:(NSData *)data
{
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    NSMutableArray<MAOListViewControllerModel *> *array = NSMutableArray.new ;
    
    NSArray *results = [json valueForKey:@"results"];
    for (NSDictionary *dict in results){
        MAOListViewControllerModel *model = [[MAOListViewControllerModel alloc] initWithDictionary:dict];
        
        [array addObject:model];
    }
    
    return array;
}
@end
