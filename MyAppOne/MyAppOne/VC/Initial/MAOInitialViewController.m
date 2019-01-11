//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

// TODO
// ACA BUSCAMOS LA DATA DEL SERVER Y AVANZAMOS AL PROXIMO VC CUANDO YA LA TENGAMOS PROCESADA

// 1-  Request al server (URL: https://itunes.apple.com/search?term=jack+johnson)
// 2 - Parser del response
// 3 - Crecion del modelo del VC 2
// 4 - Iniciar el vc 2 con el modelo
//-------------------------------------------

//NTH:
// Manejo de errores en el request.
// Mostrar mensaje mientras carga.
// Mensajes de alerta.

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "MLServiceHelper.h"



@interface MAOInitialViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation MAOInitialViewController

NSString *const APIURL_SEARCH = @"https://itunes.apple.com/search?term=jack+johnson";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showProgressIndicator: false];
}

- (IBAction)onClickSelection:(id)sender {
    
    //Ordenado alfabeticamente
    [self search: ^ NSArray * (NSArray *array){
        return [array sortedArrayUsingSelector:@selector(compare:)];
    }];
}
- (IBAction)onClickCargarDatos:(id)sender {
    
    //Ordenado alfabeticamente
    [self search: ^ NSArray * (NSArray *array){
        return array;
    }];
}

- (IBAction)onClickReleaseDate:(UIButton *)sender {
    //SortingArrayUsingComparetor
    [self search: ^ NSArray * (NSArray *array){
        return [array sortedArrayUsingComparator: ^NSComparisonResult(id a, id b) {
            NSDate *first = [(MAOListViewControllerModel*)a releaseDate];
            NSDate *second = [(MAOListViewControllerModel*)b releaseDate];
            return [first compare:second];
        }];
    }];
}

- (IBAction)onClickAlfabeticamente:(id)sender {
    
    //SortingArrayUsingComparetor
    [self search: ^ NSArray * (NSArray *array){
        return [array sortedArrayUsingComparator: ^NSComparisonResult(id a, id b) {
            NSString *first = [(MAOListViewControllerModel*)a trackName];
            NSString *second = [(MAOListViewControllerModel*)b trackName];
            return [first compare:second];
        }];
    }];
}

- (IBAction)onClickIdTrack:(id)sender {
    
    //SortingArrayUsingComparetor
    [self search: ^ NSArray * (NSArray *array){
        return [array sortedArrayUsingComparator: ^NSComparisonResult(id a, id b) {
            NSNumber *first = [(MAOListViewControllerModel*)a trackId];
            NSNumber *second = [(MAOListViewControllerModel*)b trackId];
            return [first compare:second];
        }];
    }];
}

- (IBAction)onClickResverse:(id)sender {
    [self search: ^ NSArray * (NSArray *array){
        return [[array reverseObjectEnumerator] allObjects];
    }];
}

- (void) search: (NSArray *(^)(NSArray *results)) orderArray{
    
    [self showProgressIndicator: true];
    
    [[MLServiceHelper instance] callRequest:^(NSArray *array, NSError *error)
     {
         NSMutableArray *resultArray = [[NSMutableArray alloc] init];
         
         for(NSDictionary *item in [array valueForKey: @"results"]){
             [resultArray addObject: [MAOListViewControllerModel initWithDictionary: item]];
             NSLog(@"Response: %@", item);
         }
         
         [self openMAOListView:orderArray(resultArray)];
     }
     toUrl: APIURL_SEARCH];
}

- (void) openMAOListView: (NSArray *) results{
    
    MAOListViewController *vc = [[MAOListViewController alloc] initWithModel:results];
    [self.navigationController pushViewController:vc animated:YES];
    
    [self showProgressIndicator: false];
}

- (void) showProgressIndicator:(Boolean) active{
    [self.spinner setHidden:!active];
    
    if(active){
        [self.spinner startAnimating];
    }else{
        [self.spinner stopAnimating];
    }
}

- (void) mostraAlerta {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
