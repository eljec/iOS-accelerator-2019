//
//  MAOInitialViewService.h
//  MyAppOne
//
//  Created by Marcio Mortarino on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAOInitialViewService : NSObject

+(MAOInitialViewService *) sharedInstance;

-(void) fetchItunesDataWithCompletionBlock:(void(^)(NSArray *array, NSError *error)) completionBlock;

@end

NS_ASSUME_NONNULL_END
