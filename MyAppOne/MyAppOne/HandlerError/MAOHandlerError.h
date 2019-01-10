//
//  MAOHandlerError.h
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MAOHandlerError : NSObject
+(MAOHandlerError *)sharedInstance;
-(void) handlerError:(NSError *)error response:(NSURLResponse *) response controller:(UIViewController *) controller;
@end
