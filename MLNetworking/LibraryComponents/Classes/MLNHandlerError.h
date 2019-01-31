//
//  MLNHandlerError.h
//  Pods
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNHandlerError : NSObject
-(void) handlerError:(NSError *)error controller:(UIViewController *) controller;
@end

NS_ASSUME_NONNULL_END
