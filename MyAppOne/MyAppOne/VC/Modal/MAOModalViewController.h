//
//  MAOModalViewController.h
//  MyAppOne
//
//  Created by Marcio Mortarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAOModalViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *collectionNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceTrackLabel;
@property (strong, nonatomic) IBOutlet UIImageView *trackImage;
@property (strong, nonatomic) IBOutlet UIButton *purchaseButton;

@end

NS_ASSUME_NONNULL_END
