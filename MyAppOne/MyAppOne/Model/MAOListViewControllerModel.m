//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        _trackId = [dictionary valueForKey:@"trackId"];
        _artistName = [dictionary valueForKey:@"artistName"];
        _collectionName = [dictionary valueForKey:@"collectionName"];
        _artworkUrl100 = [dictionary valueForKey:@"artworkUrl100"];
        _trackName = [dictionary valueForKey:@"trackName"];
        _artistViewUrl = [dictionary valueForKey:@"artistViewUrl"];
        _collectionViewUrl = [dictionary valueForKey:@"collectionViewUrl"];
        _trackViewUrl = [dictionary valueForKey:@"trackViewUrl"];
        _collectionPrice = [dictionary valueForKey:@"collectionPrice"];
        _trackPrice = [dictionary valueForKey:@"trackPrice"];
        _previewUrl = [dictionary valueForKey:@"previewUrl"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:00Z"];
        NSDate *theDate = [dateFormatter dateFromString:[dictionary valueForKey:@"releaseDate"]];
        _releaseDate = theDate;
    }
    return self;
}

@end
