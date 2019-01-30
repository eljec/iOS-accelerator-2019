//
//  PSItunesSong.m
//  PSSongApi
//
//  Created by VICTOR ABEL CABEZA on 30/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import "PSItunesSong.h"

@implementation PSItunesSong

// MARK: Methods

/**
 Initialize Itunes Song with parameter.
 
 @param JSONDictionary NSDictionary
 @return instancetype
 */
- (instancetype)initWithDictionary:(NSDictionary *)JSONDictionary{
    self = [super init];
    if (self) {
        
        if (JSONDictionary) {
            [self setValuesForKeysWithDictionary:JSONDictionary];
        }
    }
    return self;
}

@end
