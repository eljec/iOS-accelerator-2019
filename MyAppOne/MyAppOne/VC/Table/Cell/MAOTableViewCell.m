//
//  MAOTableViewCell.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MAOTableViewCell.h"
#import "MAOService.h"

@interface MAOTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *maoImageView;
@property (weak, nonatomic) IBOutlet UILabel *maoTrackLabel;
@property (weak, nonatomic) IBOutlet UILabel *maoAlbumLabel;
@end
@implementation MAOTableViewCell

-(void)setupWithModel:(MAOListViewControllerModel *)model{
    self.maoTrackLabel.text = model.trackName;
    self.maoAlbumLabel.text = model.collectionName;

    // Url de la imagen
    NSString *urlImage = model.artworkUrl100;
    
    __weak typeof(self) weakSelf = self;
    [[[MAOService alloc] init] fetchImageFromUrl:urlImage withCompletionBlock:^(UIImage *image) {
        weakSelf.maoImageView.image = image;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
