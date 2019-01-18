//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "../../Services/MARequestService.h"
#import "../ListCustom/MAOListCustomViewController.h"
#import "../../Model/MAOListViewControllerModel.h"

@interface MAOInitialViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSMutableArray<MAOListViewControllerModel *> *arrayModels;
@property (weak, nonatomic) IBOutlet UIImageView *resultIcon;

typedef enum {
    TRACK_ID,
    RELEASE_DATE
} OrderType;

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicator setHidden:TRUE];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)onClickSelection:(id)sender {
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidden:FALSE];
    
    [MARequestService fetchDataFromUrl:[NSURL URLWithString:@"https://itunes.apple.com/search?term=jack+johnson"]
           success:^(NSArray *dataArray) {
               NSLog(@"Data: %@",dataArray);
               dispatch_async(dispatch_get_main_queue(), ^{
                   [self.resultIcon setImage:[UIImage imageNamed:@"okIcon"]];
                   [self.activityIndicator stopAnimating];
                   [self.activityIndicator setHidden:TRUE];
               });
               dataArray = [dataArray valueForKey:@"results"];
               self.arrayModels = [[NSMutableArray<MAOListViewControllerModel *> alloc] init];
               for (id itemArray in dataArray) {
                   MAOListViewControllerModel *item = [[MAOListViewControllerModel alloc] initFromDictionary:itemArray];
                   [self.arrayModels addObject:item];
               }
           } error:^(NSError *error) {
               dispatch_async(dispatch_get_main_queue(), ^{
                   [self.resultIcon setImage:[UIImage imageNamed:@"errorIcon"]];
                   [self.activityIndicator stopAnimating];
                   [self.activityIndicator setHidden:TRUE];
               });
               [self showDialogWithTitle:@"Atención" withMessage:[error localizedDescription]];
           }];
}

- (IBAction)btnShowByReleaseTrackAsc:(UIButton *)sender {
    [self goToListShowDesc:FALSE orderByType:RELEASE_DATE];
}

- (IBAction)btnShowByReleaseTrackDesc:(UIButton *)sender {
    [self goToListShowDesc:TRUE orderByType:RELEASE_DATE];
}

- (IBAction)btnShowByTrackIdAsc:(UIButton *)sender {
    [self goToListShowDesc:FALSE orderByType:TRACK_ID];
}

- (IBAction)btnOrderByTrackIdDesc:(UIButton *)sender {
    [self goToListShowDesc:TRUE orderByType:TRACK_ID];
}

-(void) goToListShowDesc:(BOOL) showDesc orderByType:(int) type {
    if(_arrayModels != nil || [_arrayModels count] != 0) {
        NSArray *sortedArray = [_arrayModels sortedArrayUsingComparator: ^(MAOListViewControllerModel* obj1, MAOListViewControllerModel* obj2) {
            
            if(type == TRACK_ID) {
                NSNumber *obj1TrackId = [obj1 trackId];
                NSNumber *obj2TrackId = [obj2 trackId];
                
                if(showDesc) {
                    return [obj2TrackId compare:obj1TrackId];
                } else {
                    return [obj1TrackId compare:obj2TrackId];
                }
            } else if(type == RELEASE_DATE) {
                NSDate *obj1ReleaseDate = [obj1 releaseDate];
                NSDate *obj2ReleaseDate = [obj2 releaseDate];
                
                if(showDesc) {
                    return [obj2ReleaseDate compare:obj1ReleaseDate];
                } else {
                    return [obj1ReleaseDate compare:obj2ReleaseDate];
                }
            }
            return NSOrderedSame;
        }];
        
        MAOListCustomViewController *listView = [[MAOListCustomViewController alloc] initWithModel:sortedArray];
        [self.navigationController pushViewController:listView animated:YES];
    } else {
        [self.resultIcon setImage:[UIImage imageNamed:@"errorIcon"]];
        [self showDialogWithTitle:@"Atención" withMessage:@"Primero debes cargar los datos"];
    }
}

-(void) showDialogWithTitle:(NSString *)title withMessage:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
