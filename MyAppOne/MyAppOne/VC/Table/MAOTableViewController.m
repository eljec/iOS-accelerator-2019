//
//  MAOTableViewController.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOTableViewController.h"
#import "MAOTableViewCell.h"
#import "MAOModalViewController.h"

@interface MAOTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *trackTableView;
@property (strong, nonatomic) NSArray<MAOListViewControllerModel *> *arrayModels;
@end

@implementation MAOTableViewController

- (instancetype)initWithModel:(NSArray<MAOListViewControllerModel *> *)model
{
    self = [super init];
    if (self) {
        _arrayModels = model;
        self.title = @"iTunes";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.trackTableView.delegate = self;
    self.trackTableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    MAOTableViewCell *cell = (MAOTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    // Chequeo si la celda es null (es decir si es nueva o reusada);
    if (cell == nil){
        // Creo la celda
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MAOTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }
    
    // Cargo la celda
    [cell setupWithModel:[self.arrayModels objectAtIndex:indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 215;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayModels count];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MAOModalViewController *modalVC = [[MAOModalViewController alloc] initWithModel:[self.arrayModels objectAtIndex:indexPath.row]];
    
    modalVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    modalVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:modalVC animated:YES completion:nil];
}

@end
