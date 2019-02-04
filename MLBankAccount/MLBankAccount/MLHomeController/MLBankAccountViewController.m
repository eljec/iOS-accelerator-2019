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
@property (weak, nonatomic) IBOutlet UIButton *goToBalanceTable;

@end

@implementation MLBankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeColorForBalance];
    _balanceText.text = [NSString stringWithFormat:@"%ld" ,(long)[MLBankMovements loadValues]];
    _inputMoneyButton.titleLabel.text = @"Insert Value";
    _balanceButton.titleLabel.text = @"Show balance";
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

/**
 De acuerdo al valor numerico de la transaccion le asigna un color al texto mostrado en el balance
 */
- (void)changeColorForBalance {
    if ([MLBankMovements loadValues] >= 0) {
        _balanceText.textColor = UIColor.greenColor;
    } else {
        _balanceText.textColor = UIColor.redColor;
    }
}

- (IBAction)goToBalance:(id)sender {
    MLBankAccountBalanceViewController *balanceView = [[MLBankAccountBalanceViewController alloc] init];
    [self.navigationController pushViewController:balanceView animated:true];
}

@end
