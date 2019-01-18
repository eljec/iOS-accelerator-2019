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
<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (weak, nonatomic) IBOutlet UITextField *songSarchText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UISegmentedControl *orderBySegment;
@property (weak, nonatomic) IBOutlet UISwitch *ascButton;
@end
