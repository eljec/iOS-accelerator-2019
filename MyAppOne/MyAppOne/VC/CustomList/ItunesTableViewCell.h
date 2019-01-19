//
//  ItunesTableViewCell.h
//  MyAppOne
//
//  Created by Metricas on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItunesTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *artistImageView;
@property (strong, nonatomic) IBOutlet UILabel *albumNameLabel;

@end

NS_ASSUME_NONNULL_END
