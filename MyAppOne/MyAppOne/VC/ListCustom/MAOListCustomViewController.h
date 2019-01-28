//
//  MAOListCustomViewController.h
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

@interface MAOListCustomViewController : UIViewController

- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels;

@end
