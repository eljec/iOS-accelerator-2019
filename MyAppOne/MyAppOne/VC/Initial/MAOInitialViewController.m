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

    
//    NSString *itunesApi = @"https://itunes.apple.com/search?term=metallica";
//    NSError *error;
//    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:itunesApi]];
//    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    NSLog(@"json: %@", json);

    [[MAOItunes sharedInstance] fetchItunesDataWithCompletionBlock:^(NSArray *infoArray, NSError *error) {
        if (!error) {
            NSLog(@"Response => %@",infoArray);
//            [self.responseDataTextView setString:[employeeArray description]];
//            [self hideProgressIndicator];
        }
//        else
//        {
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                [NSApp presentError:error];
//            }];
//        }
    }];
}

@end
