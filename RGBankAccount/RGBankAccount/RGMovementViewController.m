//
//  RGMovementViewController.m
//  RGBankAccount
//
//  Created by Roman Guarino on 01/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

#import "RGMovementViewController.h"

@interface RGMovementViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<RGMovement *> *arrayModels;
@property (weak, nonatomic) IBOutlet UITableView *resultTable;
@end

@implementation RGMovementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultTable.delegate = self;
    self.resultTable.dataSource = self;
    [_resultTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (instancetype) initWithModel:( NSArray<RGMovement *> *) arrayModels {
    self = [super init];
    if(self){
        _arrayModels = arrayModels;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setTitle:@"Movimientos"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    RGMovement *movement = [_arrayModels objectAtIndex:[indexPath row]];
    cell.textLabel.text = [NSString stringWithFormat:@"$%.02f",[movement value]];
    
    if([movement value] < 0) {
        [cell.textLabel setTextColor:[UIColor redColor]];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
