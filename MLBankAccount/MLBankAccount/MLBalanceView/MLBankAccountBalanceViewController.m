//
//  MLBankAccountBalanceViewController.m
//  MLBankAccount
//
//  Created by Marcio Mortarino on 04/02/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import "MLBankAccountBalanceViewController.h"
#import "MLBankMovementsLib-Swift.h"

@interface MLBankAccountBalanceViewController ()
@property (weak, nonatomic) IBOutlet UITableView *balanceTableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation MLBankAccountBalanceViewController

/**
 pull-to-refresh(refreshControl) actualiza los valores de la balanceTable
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    _balanceTableView.delegate = self;
    _balanceTableView.dataSource = self;
    _refreshControl = [[UIRefreshControl alloc] init];
    _balanceTableView.refreshControl = _refreshControl;
    [_balanceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [_balanceTableView addSubview:_refreshControl];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents: UIControlEventValueChanged];
}

/**
 Al hacer pullToRefresh refresca los datos de la tabla y termina con la animacion
 */
- (void)refreshTable {
    [_refreshControl endRefreshing];
    [_balanceTableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MLBankMovements *transactionsItems = [[MLBankMovements alloc] init];
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self changeColorOf:transactionsItems in:cell at:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \t\t\t\t\t\t\t\t     %ld", transactionsItems.loadAccountOwnerFromArray[indexPath.row].accountOwner, (long)transactionsItems.loadAccountOwnerFromArray[indexPath.row].value];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MLBankMovements *transactions = [[MLBankMovements alloc] init];
    NSInteger transactionsCount = transactions.balanceCount;
    return transactionsCount;
}

/**
 De acuerdo al valor numerico de la transaccion le da un color u otro a cada transaccion.
 */
- (void)changeColorOf:(MLBankMovements *)transactionsItems in:(UITableViewCell *)cell at:(NSIndexPath *)indexPath {
    if ((long)transactionsItems.loadAccountOwnerFromArray[indexPath.row].value >= 0) {
        cell.textLabel.textColor = UIColor.greenColor;
    } else {
        cell.textLabel.textColor = UIColor.redColor;
    }
}

@end
