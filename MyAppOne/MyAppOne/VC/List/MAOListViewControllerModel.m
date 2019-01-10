//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        _artistName = [dict valueForKey:@"artistName"];
        _collectionName = [dict valueForKey:@"collectionName"];
        _trackName = [dict valueForKey:@"trackName"];
        
        _artistViewUrl = [dict valueForKey:@"artistViewUrl"];
        _collectionViewUrl = [dict valueForKey:@"collectionViewUrl"];
        _trackViewUrl = [dict valueForKey:@"trackViewUrl"];

        _collectionPrice = [dict valueForKey:@"collectionPrice"];
        _trackPrice = [dict valueForKey:@"trackPrice"];
    }
    return self;
}
@end
