//
//  MLBankAccountViewController.m
//  MLBankAccount
//
//  Created by Marcio Mortarino on 31/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import "MLBankAccountViewController.h"
#import "MLBankMovementsLib-Swift.h"


@interface MLBankAccountViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputMoney;
@property (weak, nonatomic) IBOutlet UIButton *inputMoneyButton;
@property (weak, nonatomic) IBOutlet UIButton *balanceButton;
@property (weak, nonatomic) IBOutlet UITextView *balanceText;
@property (weak, nonatomic) IBOutlet UITableView *transactionsView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation MLBankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeColorForBalance];
    _balanceText.text = [NSString stringWithFormat:@"%ld" ,(long)[MLBankMovements loadValues]];
    _inputMoneyButton.titleLabel.text = @"Insert Value";
    _balanceButton.titleLabel.text = @"Show balance";
    _transactionsView.delegate = self;
    _transactionsView.dataSource = self;
    _transactionsView.refreshControl = _refreshControl;
    [_transactionsView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [_transactionsView addSubview:_refreshControl];
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents: UIControlEventValueChanged];

}

- (void)refreshTable {
    [_refreshControl endRefreshing];
    [_transactionsView reloadData];
}

- (IBAction)moneyToInsert:(id)sender {
}
- (IBAction)sendMoneyToBalance:(id)sender {
    [MLBankMovements saveWithValue:_inputMoney.text.integerValue accountOwner:@"Yo"];
}
- (IBAction)showBalance:(id)sender {
    self.balanceText.text = [NSString stringWithFormat:@"%ld" ,(long)[MLBankMovements loadValues]];
    [self changeColorForBalance];
}

- (void)changeColorForBalance {
    if ([MLBankMovements loadValues] >= 0) {
        _balanceText.textColor = UIColor.greenColor;
    } else {
        _balanceText.textColor = UIColor.redColor;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MLBankMovements *transactionsItems = [[MLBankMovements alloc] init];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if ((long)transactionsItems.loadAccountOwnerFromArray[indexPath.row].value >= 0) {
        cell.textLabel.textColor = UIColor.greenColor;
    } else {
        cell.textLabel.textColor = UIColor.redColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \t\t\t\t\t\t\t\t\t %ld", transactionsItems.loadAccountOwnerFromArray[indexPath.row].accountOwner, (long)transactionsItems.loadAccountOwnerFromArray[indexPath.row].value];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MLBankMovements *transactionsCount = [[MLBankMovements alloc] init];
    NSInteger atr = transactionsCount.balanceCount;
    return atr;
}

@end
