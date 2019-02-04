//
//  MLBankAccountViewController.m
//  MLBankAccount
//
//  Created by Marcio Mortarino on 31/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import "MLBankAccountViewController.h"


@interface MLBankAccountViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputMoney;
@property (weak, nonatomic) IBOutlet UIButton *inputMoneyButton;
@property (weak, nonatomic) IBOutlet UIButton *balanceButton;
@property (weak, nonatomic) IBOutlet UITextView *balanceText;
@property (weak, nonatomic) IBOutlet UIButton *goToBalanceTable;

@end

@implementation MLBankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAccountData];
    [self changeColorForBalance];
}

-(void) loadAccountData {
    _account = [MLBankMovements getAccount];
    [self updateBalanceLabel];
}

- (NSString * _Nonnull)updateBalanceLabel {
    return _balanceText.text = [NSString stringWithFormat:@"%ld" ,(long)[MLBankMovements getBalanceWithAccounts:_account]];
}

- (IBAction)sendMoneyToBalance:(id)sender {
    _account = [MLBankMovements saveMovementInAccountWithValue:_inputMoney.text.integerValue accountOwner:@"Yo"];
    _inputMoney.text = @"";
    [self updateBalanceLabel];
}

- (IBAction)showBalance:(id)sender {
    [self updateBalanceLabel];
    [self changeColorForBalance];
}

/**
 De acuerdo al valor numerico de la transaccion le asigna un color al texto mostrado en el balance
 */
- (void)changeColorForBalance {
    if ([MLBankMovements getBalanceWithAccounts:_account] >= 0) {
        _balanceText.textColor = UIColor.greenColor;
    } else {
        _balanceText.textColor = UIColor.redColor;
    }
}

- (IBAction)goToBalance:(id)sender {
    MLBankAccountBalanceViewController *balanceView = [[MLBankAccountBalanceViewController alloc] initWith:_account];
    [self.navigationController pushViewController:balanceView animated:true];
}
- (IBAction)deleteMovementsFromAccount:(id)sender {
    [MLBankMovements delete];
    [self loadAccountData];
}

@end
