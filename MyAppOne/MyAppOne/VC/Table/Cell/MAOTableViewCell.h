//
//  MAOTableViewCell.h
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

@interface MAOTableViewCell : UITableViewCell
-(void)setupWithModel:(MAOListViewControllerModel *)model;
@end

