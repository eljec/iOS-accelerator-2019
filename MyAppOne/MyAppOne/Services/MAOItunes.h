//
//  MAOItunes.h
//  MyAppOne
//
//  Created by Metricas on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAOItunes : NSObject

+(MAOItunes *)sharedInstance;

-(void) fetchItunesDataWithCompletionBlock:(void(^)(NSArray *InfoArray, NSError *error)) completionBlock;

- (NSArray *) getDataFrom:(NSString *) url;

@end

NS_ASSUME_NONNULL_END
