//
//  MAOListViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewController.h"
#import "MAODetailViewController.h"

@interface MAOListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *resultTable;
@property (nonatomic, strong) NSArray<MAOListViewControllerModel *> *arrayModels;
@property (nonatomic, strong) MAOListViewControllerModel *selectedItem;

@end

@implementation MAOListViewController


- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels
{
    self = [super init];
    if(self){
        //Es recomendable usar variables de instancia
        _arrayModels = arrayModels;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Results"];
    
    [self.resultTable setDelegate: self];
    [self.resultTable setDataSource: self];
}

- (nonnull CustomTableCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier] ;
    
    if (cell == nil)
    {
        NSArray *m = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [m objectAtIndex:0];
    }
    
    MAOListViewControllerModel *model = [self.arrayModels objectAtIndex:[indexPath row]];
    cell.trackName.text =  model.trackName;
    cell.collectionName.text =  model.collectionName;
    
    NSString *urlImage = [[self.arrayModels objectAtIndex:[indexPath row]] valueForKey:@"artworkUrl100"];
    [self loadImage: urlImage toImgView:cell.imgView];
    
    return cell;
}
//TODO Gonza: Mover a un helper
- (void) loadImage: (NSString *) url toImgView: (UIImageView *) imgView
{
    dispatch_queue_t dispatchImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(dispatchImage, ^{
        NSURL *dataURL =
        [NSURL URLWithString: url];
        NSData *flagImageData = [NSData dataWithContentsOfURL:dataURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imgView.image = [UIImage imageWithData:flagImageData];
        });
    });
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((CustomTableCell *) [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil].lastObject).frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedItem = [self.arrayModels objectAtIndex:indexPath.row];
        
    MAODetailViewController *detailView = [[MAODetailViewController alloc] initWhitModel: self.selectedItem];
    
    detailView.modalPresentationStyle = UIModalPresentationOverFullScreen;
    detailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:detailView animated:YES completion:nil];
}

@end
