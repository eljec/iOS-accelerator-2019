//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "MAOInitialViewService.h"
#import "MAOListViewController.h"

@interface MAOInitialViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *MAOProgressIndicator;

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideProgressIndicator];
}

- (IBAction)onClickSelection:(id)sender {
        [self showProgressIndicator];
        [[MAOInitialViewService sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *array, NSError *error) {
            if (!error) {
                MAOListViewController *listViewControllerPtr = [[MAOListViewController alloc] init];
                array = [array valueForKey:@"results"];
                NSMutableArray *results = [[NSMutableArray alloc] init];
                for (NSDictionary *itemModel in array) {
                    [results addObject: [MAOListViewControllerModel obtainItemsFromDicionary: itemModel]] ;
                }
                [self.navigationController pushViewController:[listViewControllerPtr initWithModel:results] animated:YES];
            }
            else {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error Message"
                                                                               message:@"Oh! Something went wrong, please press again"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
            [self hideProgressIndicator];
        }];
    }

-(void)showProgressIndicator{
    [self.MAOProgressIndicator setHidden:NO];
    [self.MAOProgressIndicator startAnimating];
}

-(void)hideProgressIndicator{
    [self.MAOProgressIndicator setHidden:YES];
    [self.MAOProgressIndicator stopAnimating];
}

@end
