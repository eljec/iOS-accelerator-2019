//
//  CustomTableCell.h
//  MyAppOne
//
//  Created by Gonzalo Alexis Quarin on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *trackName;
@property (strong, nonatomic) IBOutlet UILabel *collectionName;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;


@end

NS_ASSUME_NONNULL_END
