//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"
#import "ItunesSong.h"


/**
 Song model implementation.
 */
@implementation MAOListViewControllerModel


// MARK: methods

/**
 Initialize Song model with parameter.
 
 @param ItunesSong itunesSong
 @return instancetype
 */
- (instancetype)initWithItunesSong:(ItunesSong *)itunesSong{
    self = [super init];
    if (self) {
        
        if (itunesSong) {
            self.artistName = itunesSong.artistName;
            self.collectionName = itunesSong.collectionName;
            self.trackName = itunesSong.trackName;
            self.artistViewUrl = itunesSong.artistViewUrl;
            self.collectionViewUrl = itunesSong.collectionViewUrl;
            self.trackViewUrl = itunesSong.trackViewUrl;
            self.collectionPrice = itunesSong.collectionPrice;
            self.trackPrice = itunesSong.trackPrice;
            self.trackId = itunesSong.trackId;
            self.releaseDate = itunesSong.releaseDate;
            self.artworkUrl30 = itunesSong.artworkUrl30;
            self.artworkUrl60 = itunesSong.artworkUrl60;
            self.artworkUrl100 = itunesSong.artworkUrl100;
        }
    }
    return self;
}
@end
