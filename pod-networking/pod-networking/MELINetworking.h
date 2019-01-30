//
//  MELINetworking.h
//  pod-networking
//
//  Created by Gonzalo Alexis Quarin on 30/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MELINetworking : NSObject

- (NSString *) testPOD;
+ (void) callRequest: (void(^)(NSData *array)) callback toUrl: (NSString*) url;

@end


