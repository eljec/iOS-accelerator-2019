//
//  MAOCustomTableViewCell.h
//  MyAppOne
//
//  Created by Marcio Mortarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAOCustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *bottomLabelCell;
@property (strong, nonatomic) IBOutlet UILabel *topLabelCell;
@property (strong, nonatomic) IBOutlet UIImageView *imageCell;

@end

NS_ASSUME_NONNULL_END
