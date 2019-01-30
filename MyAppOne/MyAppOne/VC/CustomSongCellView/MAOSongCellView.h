//
//  MAOSongCellViewTableViewCell.h
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 Custom cell interface for song
 */
@interface MAOSongCellView : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *trackImageView;
@property (strong, nonatomic) IBOutlet UILabel *albumNameLabel;

@end
