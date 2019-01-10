//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "MLServiceHelper.h"

@interface MAOInitialViewController ()

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)onClickSelection:(id)sender {
    
    
    //Create new dispatch for load data
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        // Load data in here
//        
//        // Call main thread to update UI
//        dispatch_async(dispatch_get_main_queue(), ^{
//            baseView.hidden = YES;
//        });
//    });
    
    
    [[MLServiceHelper instance] callRequest:^(NSArray *array, NSError *error)
                                {
                                    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
                                    
                                    
                                    //TODO Gonza: Este parseo se puede generalizar
                                    for(NSDictionary *item in [array valueForKey: @"results"]){
                                        [resultArray addObject: [MAOListViewControllerModel initWithDictionary: item]];
                                        NSLog(@"Response: %@", item);
                                    }
                                    
                                    MAOListViewController *vc = [[MAOListViewController alloc] initWithModel:resultArray];
                                    [self.navigationController pushViewController:vc animated:YES];
                                    
     
                                }
                                toUrl: @"https://itunes.apple.com/search?term=jack+johnson"];
    
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
