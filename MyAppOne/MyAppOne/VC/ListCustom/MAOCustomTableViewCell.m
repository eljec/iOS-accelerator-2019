//
//  MAOCustomTableViewCell.m
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOCustomTableViewCell.h"

@implementation MAOCustomTableViewCell

@synthesize lblAlbumName, lblTrackName, imgAlbum;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
