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

@end

@implementation MLBankAccountBalanceViewController

NSArray<Account *> *accountsPtr = nil;
static NSString *registerCell = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerBalanceTablge];
    [self initRefreshControl];
}

- (void)registerBalanceTablge {
    _balanceTableView.delegate = self;
    _balanceTableView.dataSource = self;
    [_balanceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:registerCell];
}

/**
 pull-to-refresh(refreshControl) actualiza los valores de la balanceTable
 */
-(void)initRefreshControl {
    _refreshControl = [[UIRefreshControl alloc] init];
    _balanceTableView.refreshControl = _refreshControl;
    [_balanceTableView addSubview:_refreshControl];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents: UIControlEventValueChanged];
}

- (instancetype)initWith:(NSArray<Account *> *)accounts{
    self = [super init];
    if (self) {
        accountsPtr = accounts;
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
    
    Account *transaction = accountsPtr[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:registerCell forIndexPath:indexPath];
    [self changeColorOf:transaction at:cell];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \t\t\t\t\t\t\t\t     %ld", transaction.accountOwner, transaction.value];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger transactionsCount = accountsPtr.count;
    return transactionsCount;
}

/**
 De acuerdo al valor numerico de la transaccion le da un color u otro a cada transaccion.
 */
- (void)changeColorOf:(Account *)transactionItem at:(UITableViewCell *)cell {
    if (transactionItem.value >= 0) {
        cell.textLabel.textColor = UIColor.greenColor;
    } else {
        cell.textLabel.textColor = UIColor.redColor;
    }
}

@end
