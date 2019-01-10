//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "MAOService.h"
#import "MAOHandlerError.h"


@interface MAOInitialViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_indicatorView setHidesWhenStopped:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)stopIndicatorAnim{
    [_indicatorView stopAnimating];
}

- (void)startIndicatorAnim{
    [_indicatorView startAnimating];
}

- (IBAction)onClickSelection:(id)sender {
    [self startIndicatorAnim];
    
    void (^callback) (NSData *data, NSURLResponse *response, NSError *error) = ^void (NSData *data, NSURLResponse *response, NSError *error) {

        [self stopIndicatorAnim];

        if (!error) {
            NSArray<MAOListViewControllerModel *> *datos = [[MAOService sharedInstance] parserJson:data];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                MAOListViewController * controller = [[MAOListViewController alloc] initWithModel:datos];
                
                [self.navigationController pushViewController:controller animated:YES];
            }];
        } else {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [[MAOHandlerError sharedInstance] handlerError:error response:response controller:self];
            }];
        }

    };

    
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(global, ^{
        NSString * URL = @"https://itunes.apple.com/search?term=jack+johnson";
        [[MAOService sharedInstance] fetchJsonWithCompletionBlock:callback url:URL];
    });
    
    
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

@end
