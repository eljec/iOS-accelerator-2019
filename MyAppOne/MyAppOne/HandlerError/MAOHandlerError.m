//
//  MAOHandlerError.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOHandlerError.h"

@implementation MAOHandlerError

+(MAOHandlerError *) sharedInstance
{
    static MAOHandlerError *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MAOHandlerError alloc] init];
    });
    
    return _sharedInstance;
}

-(void) handlerError:(NSError *)error response:(NSURLResponse *) response controller:(UIViewController *) controller
{
    
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:[[NSString alloc]initWithFormat:@"%@", [error domain]]
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];

        [alert addAction:defaultAction];
        [controller presentViewController:alert animated:YES completion:nil];
}

@end
