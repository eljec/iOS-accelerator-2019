//
//  MAOModalViewController.h
//  MyAppOne
//
//  Created by Metricas on 18/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MAOModalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *albumArtUIImageView;
@property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

- (instancetype) initWithModel:( MAOListViewControllerModel *) arrayModels;

@end

NS_ASSUME_NONNULL_END
