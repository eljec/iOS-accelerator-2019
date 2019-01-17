//
//  CustomSongDetailViewController.h
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

@interface CustomSongDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *trackPriceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *trackImage;



@property (strong, nonatomic) MAOListViewControllerModel *model;

-(id) initWithModel:(MAOListViewControllerModel *)model;

@end
