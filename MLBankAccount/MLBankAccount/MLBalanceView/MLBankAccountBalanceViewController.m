//
//  MLBankAccountBalanceViewController.m
//  MLBankAccount
//
//  Created by Marcio Mortarino on 04/02/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import "MLBankAccountBalanceViewController.h"

@interface MLBankAccountBalanceViewController ()
@property (weak, nonatomic) IBOutlet UITableView *balanceTableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSArray<Account *> *accounts;

@end

@implementation MLBankAccountBalanceViewController

/**
 pull-to-refresh(refreshControl) actualiza los valores de la balanceTable
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    _balanceTableView.delegate = self;
    _balanceTableView.dataSource = self;
    // Refresh Control
    _refreshControl = [[UIRefreshControl alloc] init];
    _balanceTableView.refreshControl = _refreshControl;
    [_balanceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [_balanceTableView addSubview:_refreshControl];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents: UIControlEventValueChanged];
}

- (instancetype)initWith:(NSArray<Account *> *)accounts{
    self = [super init];
    if (self) {
        _accounts = accounts;
    }
    return self;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \t\t\t\t\t\t\t\t     %ld", [transactionsItems  loadAccountOwnerFromArrayWithAccounts:_accounts][indexPath.row].accountOwner, (long)[transactionsItems loadAccountOwnerFromArrayWithAccounts:_accounts][indexPath.row].value];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger transactionsCount = _accounts.count;
    return transactionsCount;
}

/**
 De acuerdo al valor numerico de la transaccion le da un color u otro a cada transaccion.
 */
- (void)changeColorOf:(MLBankMovements *)transactionsItems in:(UITableViewCell *)cell at:(NSIndexPath *)indexPath {
    if ([_accounts objectAtIndex:indexPath.row].value >= 0) {
        cell.textLabel.textColor = UIColor.greenColor;
    } else {
        cell.textLabel.textColor = UIColor.redColor;
    }
}

@end
