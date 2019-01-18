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
    [self.spinner setHidden:YES];
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
    
    
    // hide load button
    [self.cargarDatosBtn setHidden:YES];
    
    // manage spinner
    [self.spinner startAnimating];
    [self.spinner setHidden:NO];
    
    [[MAOItunes sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *infoArray, NSError *error) {

        if (!error) {

            if ([[infoArray valueForKey:@"resultCount"] longValue] != 0) {

                // init temp MutableArray
                NSMutableArray *parseInfo = [[NSMutableArray alloc] init];

                // get the specific key = 'results'
                for (NSDictionary *element in [infoArray valueForKey:@"results"]) {
                    [parseInfo addObject:[MAOListViewControllerModel initWithDictionary:element]];
                }

                // call the second view pushing the data
                MAOListViewController *listView = [[MAOListViewController alloc] initWithModel:parseInfo];
                
                // set sleep for view animation
                sleep(2);
                
                // push to second view
                [self.navigationController pushViewController:listView animated:YES];

            }
        } else {
            
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

        // dispatch UI animations to main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // manage spinner
            [self.spinner stopAnimating];
            [self.spinner setHidden:YES];
            
            // hide button
            [self.cargarDatosBtn setHidden:NO];
        });

    }];
    
}

@end
