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

typedef NSArray * (^orderArrayBlockType)(NSArray *array, NSString *propertyName);

orderArrayBlockType orderByProperty = ^ NSArray * (NSArray *array, NSString *propertyName){
    if ([propertyName length] == 0) {
        return array;
    }
    
    return [array sortedArrayUsingComparator: ^NSComparisonResult(id a, id b) {
        NSNumber *first = [(MAOListViewControllerModel*)a valueForKey:propertyName];
        NSNumber *second = [(MAOListViewControllerModel*)b valueForKey:propertyName];
        return [first compare:second];
    }];
};

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showProgressIndicator: false];    
}

- (IBAction)onClickSelection:(id)sender {
    [self search: ^ NSArray * (NSArray *array, NSString *propertyName){
        return [array sortedArrayUsingSelector:@selector(compare:)];
    }];
}

- (IBAction)onClickCargarDatos:(id)sender {
    [self search: orderByProperty];
}

- (IBAction)onClickReleaseDate:(UIButton *)sender {
    [self search: orderByProperty toProperty:@"releaseDate"];
}

- (IBAction)onClickAlfabeticamente:(id)sender {
    [self search: orderByProperty toProperty:@"trackName"];
}

- (IBAction)onClickIdTrack:(id)sender {
    [self search: orderByProperty toProperty:@"trackId"];
}

- (IBAction)onClickResverse:(id)sender {
    [self search: ^ NSArray * (NSArray *array, NSString *toProperty){
        return [[array reverseObjectEnumerator] allObjects];
    }];
}

- (void) search: (orderArrayBlockType) orderArray toProperty: (NSString *) property{
    
    [self showProgressIndicator: true];
    
    [[MLServiceHelper instance] callRequest:^(NSArray *array, NSError *error)
     {
         NSMutableArray *resultArray = [[NSMutableArray alloc] init];
         
         for(NSDictionary *item in [array valueForKey: @"results"]){
             [resultArray addObject: [[MAOListViewControllerModel alloc] initWithDictionary: item]];
//             NSLog(@"Response: %@", item);
         }
         
         [self openMAOListView:orderArray(resultArray, property)];
     }
     toUrl: APIURL_SEARCH];
}

- (void) search: (orderArrayBlockType) orderArray {
    return [self search: orderArray toProperty: nil];
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
