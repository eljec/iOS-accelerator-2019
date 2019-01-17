//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

+ (instancetype)obtainItemsFromDiccionary:(NSDictionary *) dictionary {
    
    //Set items on model
    MAOListViewControllerModel *newListViewControllerModel = [[MAOListViewControllerModel alloc] init];
    newListViewControllerModel.artistName = dictionary[@"artistName"];
    newListViewControllerModel.collectionName = dictionary[@"collectionName"];
    newListViewControllerModel.trackName = dictionary[@"trackName"];
    newListViewControllerModel.trackId = dictionary[@"trackId"];
    newListViewControllerModel.artistViewUrl = dictionary[@"artistViewUrl"];
    newListViewControllerModel.collectionViewUrl = dictionary[@"collectionViewUrl"];
    newListViewControllerModel.trackViewUrl = dictionary[@"trackViewUrl"];
    newListViewControllerModel.collectionPrice = dictionary[@"collectionPrice"];
    newListViewControllerModel.trackPrice = dictionary[@"trackPrice"];
    newListViewControllerModel.artworkUrl100 = dictionary[@"artworkUrl100"];
    
    //Format the date to string
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *currentDate = [dateFormatter dateFromString:dictionary[@"releaseDate"]];
    newListViewControllerModel.releaseDate = [NSString stringWithFormat:@"%@", currentDate];
    
    return newListViewControllerModel;
}

@end
