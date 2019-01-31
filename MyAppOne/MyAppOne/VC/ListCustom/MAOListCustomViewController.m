//
//  MAOListCustomViewController.m
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListCustomViewController.h"
#import "MAOCustomTableViewCell.h"
#import "../Detail/MAODetailViewController.h"

@interface MAOListCustomViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *resultTable;
@property (nonatomic, strong) NSArray<MAOListViewControllerModel *> *arrayModels;
@end

@implementation MAOListCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultTable.delegate = self;
    self.resultTable.dataSource = self;
}

- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels {
    self = [super init];
    if(self){
        _arrayModels = arrayModels;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setTitle:@"Track List"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellID = @"CellID";
    MAOCustomTableViewCell *cell = (MAOCustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MAOCustomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:[_arrayModels objectAtIndex:[indexPath row]]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MAODetailViewController *detail = [[MAODetailViewController alloc] initWithModel:[self.arrayModels objectAtIndex:[indexPath row]]];
    [detail setModalPresentationStyle:UIModalPresentationOverFullScreen];
    [detail setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:detail animated:YES completion:nil];
}

@end
