//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

//TODO No hace falta sintetizar
//@synthesize artistName, collectionName, trackName, artistViewUrl, collectionViewUrl, trackViewUrl;
//@synthesize collectionPrice, trackPrice;


//Diferencia entre variable de instance y property
//Considerar que al sobrescribir un método set o get se deben usar las propiedades privadas _nombrePropiedad

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
    
    return model;
}

@end
