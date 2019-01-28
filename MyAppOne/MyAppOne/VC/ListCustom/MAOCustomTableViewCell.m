//
//  MAOCustomTableViewCell.m
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOCustomTableViewCell.h"

@interface MAOCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblTrackName;
@property (weak, nonatomic) IBOutlet UIImageView *imgAlbum;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumName;
@end

@implementation MAOCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setModel:(MAOListViewControllerModel *)model {
    [self clearItems];
    
    _lblTrackName.text = [model trackName];
    _lblAlbumName.text = [model collectionName];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[model artworkUrl100]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgAlbum.image = [UIImage imageWithData:data];
        });
    });
}

-(void) clearItems {
    _lblTrackName.text = nil;
    _lblAlbumName.text = nil;
    _imgAlbum.image = nil;
}

@end
