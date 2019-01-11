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

@interface MAOInitialViewController ()<UIPickerViewDelegate, UIPickerViewDataSource >

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *MAOProgressIndicator;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property IBOutlet NSArray *pickerData;
@property IBOutlet NSString *selectedItem;

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideProgressIndicator];
    
    _pickerData = @[@"Cargar datos ordenados asc", @"Cargar datos ordenados desc",
                    @"Cargar datos por fecha", @"Cargar datos ordenados por ID"];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
}

-(void)sortArrays:(NSMutableArray *)array by:(NSString *)order {
    NSArray *arrayTemp = [array sortedArrayUsingComparator:
             ^NSComparisonResult(MAOListViewControllerModel *obj1, MAOListViewControllerModel *obj2) {
                 if ([order isEqualToString:@"desc"]) {
                     return [obj2.trackName compare:obj1.trackName];
                 } else if ([order isEqualToString:@"trackId"]) {
                     return [obj1.trackId compare:obj2.trackId];
                 } else if ([order isEqualToString:@"releaseDate"]) {
                    return [obj1.releaseDate compare:obj2.releaseDate];
                 } else {
                    return [obj1.trackName compare:obj2.trackName];
                 }
    }];
    MAOListViewController *listViewControllerPtr = [[MAOListViewController alloc] init];
    [self.navigationController pushViewController:[listViewControllerPtr initWithModel:arrayTemp] animated:YES];
}

-(void)showProgressIndicator{
    [self.MAOProgressIndicator setHidden:NO];
    [self.MAOProgressIndicator startAnimating];
}

-(void)hideProgressIndicator{
    [self.MAOProgressIndicator setHidden:YES];
    [self.MAOProgressIndicator stopAnimating];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pickerData.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self showProgressIndicator];
    [[MAOInitialViewService sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *array, NSError *error) {
        if (!error) {
            array = [array valueForKey:@"results"];
            NSMutableArray *results = [[NSMutableArray alloc] init];
            for (NSDictionary *itemModel in array) {
                [results addObject: [MAOListViewControllerModel obtainItemsFromDicionary: itemModel]] ;
            }

            if ([self.pickerData[row] isEqual: @"Cargar datos ordenados por fecha"]) {
                [self sortArrays:results by:@"releaseDate"];
            } else if ([self.pickerData[row]  isEqual: @"Cargar datos ordenados desc"]) {
                [self sortArrays:results by:@"desc"];
            } else if ([self.pickerData[row]  isEqual: @"Cargar datos ordenados por ID"]) {
                [self sortArrays:results by:@"trackId"];
            } else {
                [self sortArrays:results by:@""];
            }
        } else {
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

@end
