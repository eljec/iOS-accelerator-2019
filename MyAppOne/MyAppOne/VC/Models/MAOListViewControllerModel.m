//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

- (NSComparisonResult) compare:(MAOListViewControllerModel *) compareModel{
    return [self.trackName compare: compareModel.trackName];    
}

- (NSString *) toString{
    return [NSString stringWithFormat:
            @"Id: %@ - TrackName: %@ - ReleaseDate: %@",
            _trackId, _trackName, [self toDateString: _dateString]];
}

- (NSString *) toDateString: (NSString *) dateString {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:00Z"];
    
    NSDate *date = [dateFormat dateFromString: dateString];
    
    NSDateFormatter *newDateFormatter = [[NSDateFormatter alloc]init];
    [newDateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    return [newDateFormatter stringFromDate:date];
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    
    if(self){
        _artistName = dictionary[@"artistName"];
        _collectionName = dictionary[@"collectionName"];
        _trackName = dictionary[@"trackName"];
        _artistViewUrl = dictionary[@"artistViewUrl"];
        _collectionViewUrl = dictionary[@"collectionViewUrl"];
        _trackViewUrl = dictionary[@"trackViewUrl"];
        _collectionPrice = dictionary[@"collectionPrice"];
        _trackPrice = dictionary[@"trackPrice"];
        _trackId = dictionary[@"trackId"];
        _releaseDate = dictionary[@"releaseDate"];
        _dateString = dictionary[@"releaseDate"];
        _artworkUrl100 = dictionary[@"artworkUrl100"];
        _previewUrl = dictionary[@"previewUrl"];
    }
    
    return self;
}




@end
