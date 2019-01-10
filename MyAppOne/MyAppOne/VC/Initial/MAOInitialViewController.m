//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "ItunesService.h"
#import "ItunesSong.h"
#import "MAOListViewController.h"
#import "ItunesSong.h"


/**
 Initial View Controller implementation.
 */
@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.spinner.hidesWhenStopped = YES;
}


/**
 Method to obtain the model list from the itunes song list

 @param songs NSArray of ItunesSongs
 @return NSMutableArray of MAOListViewControllerModel
 */
- (NSMutableArray<MAOListViewControllerModel *> *)getModeListFromItuneSongs:(NSArray *)songs {
    NSMutableArray<MAOListViewControllerModel *> *maoListModel = [[NSMutableArray alloc] init];
    
    for(ItunesSong *song in songs){
        MAOListViewControllerModel * maoListViewControllerModel = [[MAOListViewControllerModel alloc] initWithItunesSong: song];
        [maoListModel addObject:maoListViewControllerModel];
    }
    return maoListModel;
}


/**
 Method to start the list view with model.

 @param songs List of Itunes songs
 */
- (void)initializeViewListWitSongs:(NSArray *)songs {
    NSMutableArray<MAOListViewControllerModel *> * maoListModel = [self getModeListFromItuneSongs:songs];
    
    MAOListViewController *maoListViewController = [[MAOListViewController alloc] initWithModel:maoListModel];
    [maoListViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self.navigationController pushViewController:maoListViewController animated:YES];
}


/**
 Method to show a general error
 */
- (void)generalError {
    NSLog(@"Error General, consulte al alumno");
}

/**
 Click on "buscar" button action.

 @param sender the button
 */
- (IBAction)onClickSelection:(id)sender {
    [self.spinner startAnimating];
    dispatch_queue_t getSongsQueue = dispatch_queue_create("getSongsQueue", NULL);
    dispatch_async(getSongsQueue, ^{
        @try {
            ItunesService *itunesService = [ItunesService instance];
            NSArray *songs = [itunesService getSongsByQuery:self.songSarchText.text];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initializeViewListWitSongs:songs];
            });
        } @catch (NSException *exception) {
            [self generalError];
        } @finally {
            [self.spinner stopAnimating];
        }
    });
    
    // MARK: exercice description.
    
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
