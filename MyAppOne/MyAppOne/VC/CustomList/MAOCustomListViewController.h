//
//  MAOCustomListViewController.h
//  MyAppOne
//
//  Created by Metricas on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MAOCustomListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels;

@end

NS_ASSUME_NONNULL_END
