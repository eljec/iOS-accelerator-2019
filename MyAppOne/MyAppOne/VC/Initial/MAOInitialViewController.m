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
#import "NSString+FormattedDate.h"
#import "MAOTableViewController.h"

@interface MAOInitialViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UISwitch *orderTrackSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *orderReleaseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *orderRevertSwitch;
@property MAOService *service;
@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.service = [[MAOService alloc] init];
    [self.indicatorView setHidesWhenStopped:YES];
    [self.orderTrackSwitch setOn:NO];
    [self.orderReleaseSwitch setOn:NO];
    [self.orderRevertSwitch setOn:NO];
}

- (void)stopIndicatorAnim{
    [self.indicatorView stopAnimating];
}

- (void)startIndicatorAnim{
    [self.indicatorView startAnimating];
}

- (NSArray<MAOListViewControllerModel *> *)ordenarPorTrack:(NSArray<MAOListViewControllerModel *> *)array{
    NSArray *sortedArray;
    sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(MAOListViewControllerModel *a, MAOListViewControllerModel *b) {
        NSString *first = [a trackName];
        NSString *second = [b trackName];
        return [first compare:second];
    }];
    
    return sortedArray;
}

- (NSArray<MAOListViewControllerModel *> *)ordenarPorFecha:(NSArray<MAOListViewControllerModel *> *)array{
    NSArray *sortedArray;
    sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(MAOListViewControllerModel *a, MAOListViewControllerModel *b) {
        
        NSDate *primero = [NSString formattedString:[a releaseDate]];
        NSDate *segundo = [NSString formattedString:[b releaseDate]];
        
        return [primero compare:segundo];
    }];
    
    return sortedArray;
}

- (NSArray<MAOListViewControllerModel *> *)ordenarInvertido:(NSArray<MAOListViewControllerModel *> *)array{
    NSArray *sortedArray;
    sortedArray = [[array reverseObjectEnumerator] allObjects];
    return sortedArray;
}

- (IBAction)onClickSelection:(id)sender {
    
    [self startIndicatorAnim];
    
    // weak Self in block.
    __weak typeof(self) weakSelf = self;
    // Creo un callback para manejar la respuesta al pedido a la api.
    void (^callback) (NSData *data, NSURLResponse *response, NSError *error) = ^void (NSData *data, NSURLResponse *response, NSError *error) {
        
        typeof(self) strongSelf = weakSelf;
        if (strongSelf){
            // Paro la animación del indicator
            [strongSelf stopIndicatorAnim];
            
            // Chequeo si hubo error
            if (!error) {
                // Parseo los datos del json
                NSArray<MAOListViewControllerModel *> *datos = [[[MAOService alloc] init] parserJson:data];
                
                // Pregunto si tengo que ordenar el array
                BOOL ordenarPorTrack = [strongSelf.orderTrackSwitch isOn];
                BOOL ordenarPorFecha = [strongSelf.orderReleaseSwitch isOn];
                BOOL ordenarInvertido = [strongSelf.orderRevertSwitch isOn];
                
                if (ordenarPorTrack){
                    datos = [strongSelf ordenarPorTrack:datos];
                } else if (ordenarPorFecha){
                    datos = [strongSelf ordenarPorFecha:datos];
                } else if (ordenarInvertido){
                    datos = [strongSelf ordenarInvertido:datos];
                }
                
                // Hago el cambio de controller en el UIThread
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    // Creo el controller nuevo y le paso el array con los datos
                    MAOTableViewController * controller = [[MAOTableViewController alloc] initWithModel:datos];
                    // Pusheo el nuevo controller
                    [strongSelf.navigationController pushViewController:controller animated:YES];
                }];
            } else {
                // Manejo el error en el UIThread
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [[[MAOHandlerError alloc]init] handlerError:error response:response controller:strongSelf];
                }];
            }
        }
    };
    
    // Creo una cola global
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(global, ^{
        // Creo la URL
        NSString * URL = @"https://itunes.apple.com/search?term=sword+art+online";
        // Hago el pedido pasandole el callback para que se ejecute cuando termine
        [self.service fetchJsonWithCompletionBlock:callback url:URL];
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
