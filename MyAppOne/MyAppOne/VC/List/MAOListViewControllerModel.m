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
- (instancetype) initWithDictionary:(NSDictionary *) diccionario{
    
    //MAOListViewControllerModel *model = [[MAOListViewControllerModel alloc] init];
    self = [super init];
    
    _artistName = diccionario[@"artistName"];
    _collectionName = diccionario[@"collectionName"];
    _trackName = diccionario[@"trackName"];
    _artistViewUrl = diccionario[@"artistiViewUrl"];
    _collectionViewUrl = diccionario[@"collectionViewUrl"];
    _trackViewUrl = diccionario[@"trackViewUrl"];
    _collectionPrice = diccionario[@"collectionPrice"];
    _trackPrice = diccionario[@"trackPrice"];
    _trackId = diccionario[@"trackId"];
    _releaseDateString = diccionario[@"releaseDate"];
    _releaseDate = diccionario[@"releaseDate"];
    _artworkUrl100 = diccionario[@"artworkUrl100"];
    
    return self;
}

@end
