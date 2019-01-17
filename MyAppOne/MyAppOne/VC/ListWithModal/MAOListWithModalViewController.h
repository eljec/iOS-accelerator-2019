//
//  MAOListWithModalViewController.h
//  MyAppOne
//
//  Created by Marcio Mortarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../List/MAOListViewControllerModel.h"
#import "../Initial/MAOInitialViewController.h"



NS_ASSUME_NONNULL_BEGIN

@interface MAOListWithModalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels andData:(NSString *) pickerData;


@end

NS_ASSUME_NONNULL_END
