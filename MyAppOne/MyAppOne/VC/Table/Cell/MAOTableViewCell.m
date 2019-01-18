//
//  MAOTableViewCell.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOTableViewCell.h"
#import <Foundation/Foundation.h>

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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Obtengo la imagen en bytes
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlImage]];
        dispatch_async(dispatch_get_main_queue(), ^{
            typeof(self) strongSelf = weakSelf;
            if (strongSelf){
            strongSelf.maoImageView.image = [UIImage imageWithData:data];
            }
        });
    });
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
