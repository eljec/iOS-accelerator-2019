//
//  MAOListWithModalViewController.m
//  MyAppOne
//
//  Created by Marcio Mortarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListWithModalViewController.h"
#import "MAOCustomTableViewCell.h"
#import "../Modal/MAOModalViewController.h"

@interface MAOListWithModalViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<MAOListViewControllerModel *> *arrayModels;
@property (nonatomic, strong) NSString *pickerData;



@end

@implementation MAOListWithModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (instancetype)initWithModel:(NSArray<MAOListViewControllerModel *> *)arrayModels andData:(NSString *)pickerData {
        self = [super init];
        if(self){
            _arrayModels = arrayModels;
            _pickerData = pickerData;
        }
        return self;
}

//- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels {
//    self = [super init];
//    if(self){
//        _arrayModels = arrayModels;
//    }
//    return self;
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSUInteger row = indexPath.row;
//    [self.names removeObjectAtIndex:row];
//    [self.surfaces removeObjectAtIndex:row];
//    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
//}

- (nonnull MAOCustomTableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellID = @"CellID";
    MAOCustomTableViewCell *cell = (MAOCustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *createCell = [[NSBundle mainBundle] loadNibNamed:@"MAOCustomTableViewCell" owner:self options:nil];
        cell = [createCell objectAtIndex:0];
    }
    cell.topLabelCell.text = [[self.arrayModels objectAtIndex:[indexPath row]] trackName];
    cell.bottomLabelCell.text = [[self.arrayModels objectAtIndex:[indexPath row]] collectionName];
    [self setTitle:self.pickerData];
    dispatch_queue_t dispatchImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(dispatchImage, ^{
        NSURL *dataURL = [NSURL URLWithString:[[self.arrayModels objectAtIndex:[indexPath row]] artworkUrl100]];
        NSData *albumImage = [NSData dataWithContentsOfURL:dataURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageCell.image = [UIImage imageWithData:albumImage];
        });
    });
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MAOModalViewController *nextView = [[MAOModalViewController alloc] init];
    [self.navigationController presentViewController:nextView animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 169.5;
}


@end
