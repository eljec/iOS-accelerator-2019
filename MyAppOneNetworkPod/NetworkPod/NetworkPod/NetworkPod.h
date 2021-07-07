//
//  NetworkPod.h
//  NetworkPod
//
//  Created by Marcio Mortarino on 30/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkPod : NSObject

-(void) requestForUserData:(void(^)(NSData *data))completionHandlerSucess with:(void(^)(NSError *error))completionHandlerError partOfUrl:(NSString *)partOfUrl;

@end

NS_ASSUME_NONNULL_END
