//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "../ListWithModal/MAOListWithModalViewController.h"
#import "MAOInitialViewService.h"

@interface MAOInitialViewController ()<UIPickerViewDelegate, UIPickerViewDataSource >
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *MAOProgressIndicator;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *pickerData;
@property (strong, nonatomic) NSString *selectedRowOfPickerView;
@property (strong, nonatomic) NSString *selectedItem;

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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self showProgressIndicator];
    
    [[MAOInitialViewService sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
        if (!error) {
            [self makeArray:array withModelItems:error fromListRow:row];
        } else {
            [self createAlertErrorModal];
        }
        [self hideProgressIndicator];
    } partOfUrl:[[self.searchBar.text componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""]];
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

-(void)makeArray:(NSArray *)array withModelItems:(NSError *)error fromListRow:(NSInteger)row {
    NSMutableArray *results = [[NSMutableArray alloc] init];
    MAOListViewControllerModel *newListViewControllerModel = [[MAOListViewControllerModel alloc] init];
    for (NSDictionary *itemModel in [array valueForKey:@"results"]) {
        [results addObject: [newListViewControllerModel initItemsFromDiccionary: itemModel]] ;
    }
    self.selectedRowOfPickerView = self.pickerData[row];
    if ([self.pickerData[row] isEqual: @"Cargar datos ordenados por fecha"]) {
        [self sortArrays:results by:@"releaseDate"];
    } else if ([self.pickerData[row]  isEqual: @"Cargar datos ordenados desc"]) {
        [self sortArrays:results by:@"desc"];
    } else if ([self.pickerData[row]  isEqual: @"Cargar datos ordenados por ID"]) {
        [self sortArrays:results by:@"trackId"];
    } else {
        [self sortArrays:results by:@""];
    }
}

-(void)sortArrays:(NSMutableArray *)array by:(NSString *)order {
    NSArray *arrayTemp = [array sortedArrayUsingComparator:
                          ^NSComparisonResult(MAOListViewControllerModel *obj1, MAOListViewControllerModel *obj2) {
                              return [self compare:obj1 with:obj2 by:order];
                          }];
    MAOListWithModalViewController *listViewControllerPtr = [[MAOListWithModalViewController alloc] init];
    [self.navigationController pushViewController:[listViewControllerPtr initWithModel:arrayTemp andData:self.selectedRowOfPickerView] animated:YES];
}

-(NSComparisonResult)compare:(MAOListViewControllerModel *)firstObj with:(MAOListViewControllerModel *)secondObj by:(NSString *)order {
    if ([order isEqualToString:@"desc"]) {
        return [secondObj.trackName compare:firstObj.trackName];
    } else if ([order isEqualToString:@"trackId"]) {
        return [firstObj.trackId compare:secondObj.trackId];
    } else if ([order isEqualToString:@"releaseDate"]) {
        return [firstObj.releaseDate compare:secondObj.releaseDate];
    } else {
        return [firstObj.trackName compare:secondObj.trackName];
    }
}

-(void)createAlertErrorModal {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error Message"
                                                                   message:@"Oh! Something went wrong, please press again"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
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
