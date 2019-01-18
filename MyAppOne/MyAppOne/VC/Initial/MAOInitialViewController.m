//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOService.h"
#import "MAOHandlerError.h"
#import "NSString+FormattedDate.h"
#import "MAOTableViewController.h"

#define SORT_ALG_BY_TRACK 0
#define SORT_ALG_BY_RELEASE_DATE 1

@interface MAOInitialViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *orderChooser;
@property (weak, nonatomic) IBOutlet UISwitch *orderRevertSwitch;

@property (nonatomic) NSInteger selectedSortAlg;
@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.indicatorView setHidesWhenStopped:YES];
    [self.orderRevertSwitch setOn:NO];
    self.selectedSortAlg = self.orderChooser.selectedSegmentIndex;
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

- (IBAction)changeSearchOption:(UISegmentedControl *)sender {
    self.selectedSortAlg = sender.selectedSegmentIndex;
}

- (IBAction)onClickSelection:(id)sender {
    
    // Lanzo animacion
    [self startIndicatorAnim];
    
    // Armo la URL
    NSMutableString * URL = [[NSMutableString alloc] initWithFormat: @"https://itunes.apple.com/search?term="];
    NSString *queryMusic = [NSString formattedURLParams:self.searchTextField.text];
    [URL appendString:queryMusic];
    
    
    // weak Self in block.
    __weak typeof(self) weakSelf = self;
    // Creo un callback para manejar la respuesta al pedido a la api.
    void (^completionBlock) (NSData *data, NSURLResponse *response) = ^void (NSData *data, NSURLResponse *response) {
        
        typeof(self) strongSelf = weakSelf;
        if (strongSelf){
            // Parseo los datos del json
            NSArray<MAOListViewControllerModel *> *datos = [[[MAOService alloc] init] parserJson:data];
            
            switch (strongSelf.selectedSortAlg) {
                case SORT_ALG_BY_TRACK:
                    datos = [strongSelf ordenarPorTrack:datos];
                    break;
                case SORT_ALG_BY_RELEASE_DATE:
                    datos = [strongSelf ordenarPorFecha:datos];
                    break;
            }
            
            // Invertir
            BOOL ordenarInvertido = [strongSelf.orderRevertSwitch isOn];
            if (ordenarInvertido){
                datos = [strongSelf ordenarInvertido:datos];
            }
            
            // Paro la animación del indicator
            [strongSelf stopIndicatorAnim];
            
            // Hago el cambio de controller en el UIThread
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                // Creo el controller nuevo y le paso el array con los datos
                MAOTableViewController * controller = [[MAOTableViewController alloc] initWithModel:datos];
                // Pusheo el nuevo controller
                [strongSelf.navigationController pushViewController:controller animated:YES];
            }];
        }
    };
    
    
    void (^errorBlock)(NSError *error) = ^void (NSError *error){
        typeof(self) strongSelf = weakSelf;
        if (strongSelf){
            //Manejo el error en el UIThread
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [[[MAOHandlerError alloc]init] handlerError:error controller:strongSelf];
            }];
        }
    };
    
    
    // Hago el pedido pasandole el callback para que se ejecute cuando termine
    [[[MAOService alloc] init] fetchJsonWithCompletionBlock:completionBlock errorBlock:errorBlock url:URL];
    
    
    
    
    
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
