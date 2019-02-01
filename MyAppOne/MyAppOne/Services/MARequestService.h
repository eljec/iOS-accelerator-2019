//
//  MARequestService.h
//  MyAppOne
//
//  Created by Roman Guarino on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MARequestService : NSObject

+(void) fetchDataFromUrl:(NSURL *)url success:(void (^)(NSArray *dataArray))onSuccess error:(void (^)(NSError *error))onError;

@end
