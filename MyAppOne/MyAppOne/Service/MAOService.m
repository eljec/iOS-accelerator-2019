//
//  MAOService.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOService.h"

@implementation MAOService

-(void) fetchJsonWithCompletionBlock:(void(^)(NSData *data, NSURLResponse *urlResponse))completionBlock errorBlock:(void(^)(NSError *error))errorBlock url:(NSString *) url{
    
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
        
        
        NSURL *dataURL = [NSURL URLWithString:url];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
        
        
        [[delegateFreeSession dataTaskWithRequest:request
                                completionHandler:^void (NSData *data, NSURLResponse *urlResponse, NSError *error){
                                    
                                    if (!error){
                                        completionBlock(data, urlResponse);
                                    } else {
                                        errorBlock(error);
                                    }
                                    
                                }]resume];
    });
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


-(void)fetchImageFromUrl:(NSString *)url withCompletionBlock:(void (^)(UIImage *))completionBlock{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Obtengo la imagen en bytes
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock([UIImage imageWithData:data]);
        });
    });
}

@end
