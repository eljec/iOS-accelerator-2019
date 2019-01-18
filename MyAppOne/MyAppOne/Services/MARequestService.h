//
//  MARequestService.h
//  MyAppOne
//
//  Created by Roman Guarino on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MARequestService : NSObject

+(MARequestService *) sharedInstance;

-(void) fetchData:(void(^)(NSArray *dataArray, NSError *error)) completionBlock fromString:(NSString *)urlStr;
-(void) fetchData:(void(^)(NSArray *dataArray, NSError *error)) completionBlock fromURL:(NSURL *)url;

@end
