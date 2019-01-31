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

@end

@implementation MLBankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)moneyToInsert:(id)sender {
}
- (IBAction)sendMoneyToBalance:(id)sender {
}
- (IBAction)showBalance:(id)sender {
}

@end
