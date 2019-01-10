//
//  MAOInitialViewController.h
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 Initial View Controller interface.
 */
@interface MAOInitialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *songSarchText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end
