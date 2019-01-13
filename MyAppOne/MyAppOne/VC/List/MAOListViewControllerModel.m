//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

// method to String to Date for value of JSON
- (NSString *) dateToString: (NSString *) dateString {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:00Z"];
    
    NSDate *date = [dateFormat dateFromString: dateString];
    
    NSDateFormatter *newDateFormatter = [[NSDateFormatter alloc]init];
    [newDateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    return [newDateFormatter stringFromDate:date];
}

// siempre que se haga un init se devuelve instancetype para respetar herencia
+ (instancetype) initWithDictionary:(NSDictionary *) diccionario{
    
    MAOListViewControllerModel *model = [[MAOListViewControllerModel alloc] init];
    
    model.artistName = diccionario[@"artistName"];
    model.collectionName = diccionario[@"collectionName"];
    model.trackName = diccionario[@"trackName"];
    model.artistViewUrl = diccionario[@"artistiViewUrl"];
    model.collectionViewUrl = diccionario[@"collectionViewUrl"];
    model.trackViewUrl = diccionario[@"trackViewUrl"];
    model.collectionPrice = diccionario[@"collectionPrice"];
    model.trackPrice = diccionario[@"trackPrice"];
    model.trackId = diccionario[@"trackId"];
    model.releaseDateString = diccionario[@"releaseDate"];
    model.releaseDate = diccionario[@"releaseDate"];
    
    return model;
}

@end
