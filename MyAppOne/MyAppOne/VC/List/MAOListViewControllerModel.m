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

+ (instancetype) initWithDictionary: (NSDictionary *) dictionary
{
    MAOListViewControllerModel *model = [[MAOListViewControllerModel alloc] init];
    model.artistName = dictionary[@"artistName"];
    model.collectionName = dictionary[@"collectionName"];
    model.trackName = dictionary[@"trackName"];
    model.artistViewUrl = dictionary[@"artistViewUrl"];
    model.collectionViewUrl = dictionary[@"collectionViewUrl"];
    model.trackViewUrl = dictionary[@"trackViewUrl"];
    model.collectionPrice = dictionary[@"collectionPrice"];
    model.trackPrice = dictionary[@"trackPrice"];
    model.trackId = dictionary[@"trackId"];
    model.releaseDate = dictionary[@"releaseDate"];
    model.dateString = dictionary[@"releaseDate"];
    
    return model;
}

@end
