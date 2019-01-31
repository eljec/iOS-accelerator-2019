//
//  MAOTableViewController.h
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

@interface MAOTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
- (instancetype)initWithModel:(NSArray<MAOListViewControllerModel *> *)model;
@end


