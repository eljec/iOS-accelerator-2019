//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

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
    
    return model;
}

@end
