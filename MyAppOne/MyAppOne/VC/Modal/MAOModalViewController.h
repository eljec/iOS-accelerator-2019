//
//  MAOModalViewController.h
//  MyAppOne
//
//  Created by Marcio Mortarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../ListWithModal/MAOListWithModalViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface MAOModalViewController : UIViewController

- (instancetype)initWithModel:(MAOListViewControllerModel *)model;

@end

NS_ASSUME_NONNULL_END
