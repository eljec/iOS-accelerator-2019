//
//  CBMovementTableController.m
//  CuentaBancariaUI
//
//  Created by Pedro Eduardo Waquim on 04/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "CBMovementTableController.h"
#import "CBMovementCell.h"
#import <CuentaBancariaLIB/CuentaBancariaLIB-Swift.h>

@interface CBMovementTableController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMovement;
@property (nonatomic) NSArray<CBTransaction *> *movements;
@end

@implementation CBMovementTableController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _movements = [CBCuenta showTransactions];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableMovement.delegate = self;
    self.tableMovement.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movements.count;
}

- (CBMovementCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CBMovementCell *cell = (CBMovementCell *)[tableView dequeueReusableCellWithIdentifier: @"cellID"];
    
    if (cell == nil){
        NSArray *m = [[NSBundle mainBundle] loadNibNamed:@"CBMovementCell" owner:self options:nil];

        cell = [m objectAtIndex:0];
    }
    
    [cell cargar:self.movements[indexPath.row]];
   
    return cell;
}

@end
