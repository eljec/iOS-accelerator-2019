//
//  MAOCustomListViewController.m
//  MyAppOne
//
//  Created by Metricas on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOCustomListViewController.h"
#import "ItunesTableViewCell.h"
#import "MAOModalViewController.h"

//@interface MAOCustomListViewController () <UITableViewDelegate, UITableViewDataSource>
//
//@end

@interface MAOCustomListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *resultTable;
@property (nonatomic, strong) NSArray<MAOListViewControllerModel *> *arrayModels;
@property (nonatomic, strong) NSIndexPath *lastIndexPath;
@end

@implementation MAOCustomListViewController

- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels{
    self = [super init];
    if(self){
        _arrayModels = arrayModels;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultTable.delegate = self;
    self.resultTable.dataSource = self;
}

// inicializacion de la custom cell en la tabla
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    // colocamos custom view que creamos
    ItunesTableViewCell *cell = (ItunesTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        // nsbundle porque neceisto cargar un archivo, loadNibName para poder trabajar con archivos .xib, owner = self porque es la misma vista a la que hace referencia
        NSArray *m = [[NSBundle mainBundle] loadNibNamed:@"ItunesTableViewCell" owner:self options:nil];
        cell = [m objectAtIndex:0];
    }
    cell.trackNameLabel.text= [self.arrayModels objectAtIndex:indexPath.row].trackName;
    cell.albumNameLabel.text= [self.arrayModels objectAtIndex:indexPath.row].collectionName;
    NSData *images = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[self.arrayModels objectAtIndex:indexPath.row].artworkUrl100]];
    cell.artistImageView.image = [UIImage imageWithData:images];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((ItunesTableViewCell *) [[NSBundle mainBundle] loadNibNamed:@"ItunesTableViewCell" owner:self options:nil].lastObject).frame.size.height;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAOListViewControllerModel *modelo = [self.arrayModels objectAtIndex:indexPath.row];
    MAOModalViewController *modalView = [[MAOModalViewController alloc] initWithModel:modelo];
//    modalView.trackNameLabel.text = [self.arrayModels objectAtIndex:indexPath.row].trackName;
//    modalView.albumNameLabel.text = [self.arrayModels objectAtIndex:indexPath.row].collectionName;
//    modalView.artistNameLabel.text = [self.arrayModels objectAtIndex:indexPath.row].artistName;
//    NSData *images = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[self.arrayModels objectAtIndex:indexPath.row].artworkUrl100]];
//    modalView.albumArtUIImageView.image = [UIImage imageWithData:images];
    modalView.modalPresentationStyle = UIModalPresentationOverFullScreen;
    modalView.modalTransitionStyle = UIModalPresentationOverFullScreen;
    
    [self presentViewController:modalView animated:YES completion:nil];
    
}

@end
