//
//  MAOSongListController.m
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOSongListController.h"
#import "ItunesService.h"
#import "MAOSongCellView.h"
#import "MAOCustomSongDetailViewController.h"

@implementation MAOSongListController

/**
 Initialization of view with model.
 
 @param arrayModels array of MAOListViewControllerModel
 @return instancetype
 */
- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels
{
    self = [super init];
    if(self){
        self.arrayModels = arrayModels;
    }
    
    return self;
}

/**
 Method to initialize the main table.

 @param height table height
 @param width table width
 @param vistaSimple the home table view
 */
- (void)initializeMainTable:(CGFloat)height andWidth:(CGFloat)width simpleView:(UIView *)vistaSimple {
    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 50.0f, width, height)];
    
    self.mainTable.dataSource = self;
    self.mainTable.delegate = self;
    
    [vistaSimple addSubview:self.mainTable];
    [self.mainTable reloadData];
}


/**
 Method to initialize the navigation bar.

 @param height table height
 @param simpleView the home table view
 */
- (void)initializeNavigationBar:(CGFloat)height simpleView:(UIView *)simpleView {
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, height, 50.0f)];

    [simpleView addSubview:self.navigationBar];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        CGFloat height = [UIScreen mainScreen].bounds.size.width;
        CGFloat width = [UIScreen mainScreen].bounds.size.height;
        UIView *simpleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, height, width)];
        
        [self initializeMainTable:width andWidth:height simpleView:simpleView];
        [self initializeNavigationBar:height simpleView:simpleView];
        
        self.title = @"Song List";
        self.view = simpleView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// cantidad de secciones de la tabla
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//numero de filas en la seccion
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayModels count];
}

//dice como va a ser la celda en un indice particular
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CellID";
    MAOSongCellView *cell = (MAOSongCellView *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil){
        NSArray *m = [[NSBundle mainBundle] loadNibNamed:@"MAOSongCellView" owner:self options:nil];
        cell= [m objectAtIndex:0];
    }
    
    MAOListViewControllerModel *song = [self.arrayModels objectAtIndex:indexPath.row];
    
    cell.trackNameLabel.text = song.trackName;
    
    cell.albumNameLabel.text = song.collectionName;
    
    dispatch_queue_t dispatchImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(dispatchImage, ^{
        NSURL *dataURL = [NSURL URLWithString:song.artworkUrl60];
        NSData *albumImage = [NSData dataWithContentsOfURL:dataURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.trackImageView.image = [UIImage imageWithData:albumImage];
        });
    });
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.lastIndexPath = indexPath;
    
    MAOCustomSongDetailViewController *customSongDetailViewController = [[MAOCustomSongDetailViewController alloc] initWithModel:[self.arrayModels objectAtIndex:self.lastIndexPath.row]];
    
    [self presentViewController:customSongDetailViewController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAOSongCellView *cell = [tableView cellForRowAtIndexPath:indexPath];
////
////    int topPadding = cell..frame.origin.x;
//////    int bottomPadding = cell.frame.size.heigth-(topPadding+cell.yourLabel.frame.size.height);
//////    NSString *text = [DescArr objectAtIndex:[indexPath row]];
//////    CGSize maximumSize = CGSizeMake(cell.yourLabel.frame.size.width, 9999);
//////    CGSize expectedSize = [text sizeWithFont:yourCell.yourLabel.font constrainedToSize:maximumSize lineBreakMode:yourCell.yourLabel.lineBreakMode];
//////
//////    return topPadding+expectedSize.height+bottomPadding;
//
//    //[self configureCell:cell];
//
//    // edit: Need to call [cell layoutIfNeeded]; otherwise the layout changes wont be applied to the   cell
//
//    [cell layoutIfNeeded];
//
//
//    return [cell.contentView systemLayoutSizeFittingSize: UILayoutFittingCompressedSize].height;
    return 186.5;
}

@end
