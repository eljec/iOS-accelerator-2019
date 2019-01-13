//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "MAOItunes.h"
#import "MAOListViewControllerModel.h"

@interface MAOInitialViewController ()

@property (strong, nonatomic) IBOutlet UIButton *cargarDatosBtn;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // hide spinner in init
    [self startSpinner:NO];
}

// method to show alert with error
- (void) showAlert:(NSError *) error{
    // declare msg error, consultar cual forma es la correcta de acceder [error code] o error.code
    NSString *errorMsg = [[NSString alloc] initWithFormat:@"Error code: %ld. %@.", error.code, error.localizedFailureReason];
    // declare UIAlertController with options
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error request"
                                                                   message:errorMsg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    // declare actions to Alert
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    // add action to Alert
    [alert addAction:defaultAction];
    // show Alert
    [self presentViewController:alert animated:YES completion:nil];
}

// method to call a second listViewController with specific info
- (void) callSecondView:(NSArray *) withParam{
    // call the second view pushing the data
    MAOListViewController *listView = [[MAOListViewController alloc] initWithModel:withParam];
    // set sleep for view animation
    sleep(1);
    // push to second view
    [self.navigationController pushViewController:listView animated:YES];
}

// method to manage the spinner
- (void) startSpinner:(Boolean) param{
    if (param) {
        [self.spinner startAnimating];
        [self.spinner setHidden:NO];
    } else {
        [self.spinner stopAnimating];
        [self.spinner setHidden:YES];
    }
    
}

// instance the service and get the data
-(void)getInfoWihCompletionHandler:(NSArray *(^)(NSArray *results)) completionHandler{
    
    [[MAOItunes sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *infoArray, NSError *error){
         NSMutableArray *parseInfo = [[NSMutableArray alloc] init];
        if (!error) {
            if ([[infoArray valueForKey:@"resultCount"] longValue] != 0) {
                 for(NSDictionary *item in [infoArray valueForKey: @"results"]){
                     [parseInfo addObject: [MAOListViewControllerModel initWithDictionary: item]];
                 }
                // call second view
                [self callSecondView:completionHandler(parseInfo)];
            }
        } else {
            // call alert method
            [self showAlert:error];
        }
     }];
}


- (IBAction)onClickSelection:(id)sender {
    
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
    
    [self startSpinner:YES];
    
    // call method with block
    [self getInfoWihCompletionHandler:^NSArray *(NSArray *info){
        return info;
    }];
    
    // dispatch UI animations to main queue
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startSpinner:NO];
    });
    
}

// Order songs by ID
- (IBAction)orderByID:(UIButton *)sender {
    
    // define NSSortDescriptor to sort array later
    NSSortDescriptor *trackIdSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"trackId"
                                                                        ascending:YES];
    
    [self startSpinner:YES];
    
    [self getInfoWihCompletionHandler:^NSArray *(NSArray *info){
        // here in the block we use the method sortedArrayUsingDescriptors of NSArray and pass the NSSortDescriptor = trackIdSortDescriptor
        return [info sortedArrayUsingDescriptors:@[trackIdSortDescriptor]];
    }];
    // dispatch UI animations to main queue
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startSpinner:NO];
    });
}

- (IBAction)orderByReleaseDate:(UIButton *)sender {
    
    [self startSpinner:YES];
    
    [self getInfoWihCompletionHandler:^NSArray *(NSArray *info){
        
        // use of sortedArrayUsingComparator
        return [info sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [[obj1 valueForKey:@"releaseDate"] compare:[obj2 valueForKey:@"releaseDate"]];
        }];
    }];
    // dispatch UI animations to main queue
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startSpinner:NO];
    });
}

- (IBAction)orderByInverseOrigin:(UIButton *)sender {
    
    [self startSpinner:YES];
    
    [self getInfoWihCompletionHandler:^NSArray *(NSArray *info){
        
        // sort array using reverseObjectEnumerator method
        return [[info reverseObjectEnumerator] allObjects];
        
    }];
    // dispatch UI animations to main queue
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startSpinner:NO];
    });
}

@end
