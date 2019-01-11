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

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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


    [[MAOItunes sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *infoArray, NSError *error) {
        if (!error) {
            //NSLog(@"items = %lu",[infoArray count]);
            if ([[infoArray valueForKey:@"resultCount"] longValue] != 0) {
            //if ([infoArray indexOfObject:0] > 0) {
                
                // init temp MutableArray
                NSMutableArray *parseInfo = [[NSMutableArray alloc] init];
                
                // get the specific key = 'results'
                for (NSDictionary *element in [infoArray valueForKey:@"results"]) {
                    [parseInfo addObject:[MAOListViewControllerModel initWithDictionary:element]];
                }
                
                // call the second view pushing the data
                MAOListViewController *listView = [[MAOListViewController alloc] initWithModel:parseInfo];
                [self.navigationController pushViewController:listView animated:YES];
            
            }
        } else {
            // declare msg error
            NSString *errorMsg = [[NSString alloc] initWithFormat:@"Error code: %ld. %@. %@.", error.code, error.description, error.localizedFailureReason];
            // declare UIAlertController with options
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error response"
                                                                           message:errorMsg
                                                                preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            NSLog(@"description = %@", [error localizedDescription]);
            NSLog(@"suggestion = %@", [error domain]);
            NSLog(@"code = %ld", [error code]);
            NSLog(@"failure = %@", [error localizedFailureReason]);
        }
    }];

    // Reveer esto
//    NSArray *response = [[NSArray alloc] init];
//    response = [[MAOItunes sharedInstance] getDataFrom:@"#"];
}

@end
