//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

- (instancetype)initItemsFromDiccionary:(NSDictionary *) dictionary {
    self = [super init];
    if(self) {
        _artistName = dictionary[@"artistName"];
        _collectionName = dictionary[@"collectionName"];
        _trackName = dictionary[@"trackName"];
        _trackId = dictionary[@"trackId"];
        _artistViewUrl = dictionary[@"artistViewUrl"];
        _collectionViewUrl = dictionary[@"collectionViewUrl"];
        _trackViewUrl = dictionary[@"trackViewUrl"];
        _collectionPrice = dictionary[@"collectionPrice"];
        _trackPrice = dictionary[@"trackPrice"];
        _artworkUrl100 = dictionary[@"artworkUrl100"];
        _previewUrl = dictionary[@"previewUrl"];
        
        //Format the date to string
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        NSDate *currentDate = [dateFormatter dateFromString:dictionary[@"releaseDate"]];
        _releaseDate = [NSString stringWithFormat:@"%@", currentDate];
    }
    return self;
}

@end
