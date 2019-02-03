//
//  MainViewController.m
//  cuenta-bancaria
//
//  Created by Gonzalo Alexis Quarin on 02/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "MainViewController.h"
#import "CuentaBancariaLib-Swift.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *saldo;

@end

@implementation MainViewController

static NSString *_identifier = @"id_cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerTable];
    [self loadData];
    
}

- (void) loadData {
    Cuenta *cuenta = [CuentaService getCuenta];
    self.saldo.text = [NSString stringWithFormat:@"%f", cuenta.saldo];
    
}

- (void) registerTable {
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:_identifier];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_identifier];
    }
    
    cell.textLabel.text = @"02/02/1992 | $500,00";
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}



@end
