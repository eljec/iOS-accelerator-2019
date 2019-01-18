//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

- (id)initFromDictionary:(NSDictionary * )item {
    if(!(self = [super init])) {
        return nil;
    }
    
    _trackId = [item valueForKey:@"trackId"];
    _artistName = [item valueForKey:@"artistName"];
    _collectionName = [item valueForKey:@"collectionName"];
    _trackName = [item valueForKey:@"trackName"];
    _artistViewUrl = [item valueForKey:@"artistViewUrl"];
    _collectionViewUrl = [item valueForKey:@"collectionViewUrl"];
    _trackViewUrl = [item valueForKey:@"trackViewUrl"];
    _collectionPrice = [item valueForKey:@"collectionPrice"];
    _trackPrice = [item valueForKey:@"trackPrice"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:00Z"];
    NSDate *theDate = [dateFormatter dateFromString:[item valueForKey:@"releaseDate"]];
    _releaseDate = theDate;
    
    return self;
}

@end
