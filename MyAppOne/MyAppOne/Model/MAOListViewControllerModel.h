//
//  MAOListViewControllerModel.h
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAOListViewControllerModel : NSObject

@property (nonatomic, copy) NSNumber *trackId;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *collectionName;
@property (nonatomic, copy) NSString *trackName;
@property (nonatomic, copy) NSString *artistViewUrl;
@property (nonatomic, copy) NSString *collectionViewUrl;
@property (nonatomic, copy) NSString *artworkUrl100;
@property (nonatomic, copy) NSString *trackViewUrl;
@property (nonatomic, copy) NSNumber *collectionPrice;
@property (nonatomic, copy) NSNumber *trackPrice;
@property (nonatomic, copy) NSDate *releaseDate;
@property (nonatomic, copy) NSString *previewUrl;

-(instancetype) initFromDictionary:(NSDictionary *)dictionary;

@end

