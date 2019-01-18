//
//  MLServiceHelper.h
//  MyAppOne
//
//  Created by Gonzalo Alexis Quarin on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLServiceHelper : NSObject

+ (instancetype) instance;

- (void) callRequest: (void(^)(NSArray *array, NSError *error)) callback toUrl: (NSString*) url;

@end

