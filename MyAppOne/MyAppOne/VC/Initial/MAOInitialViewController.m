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

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)onClickSelection:(id)sender
    
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
    {
        [[MAOInitialViewService sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *array, NSError *error) {
            if (error) {
                NSLog(@"Array of songs %@",array);;
                MAOListViewController *listViewControllerPtr = [[MAOListViewController alloc] init];
                listViewControllerPtr = [listViewControllerPtr initWithModel:array];
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
        }];
    }
    
    


@end
