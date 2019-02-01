//
//  BankAccountLoginViewController.m
//  BankAccountView
//
//  Created by VICTOR ABEL CABEZA on 01/02/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import "BankAccountLoginViewController.h"
#import <BankApi/BankApi-Swift.h>
#import "BankAccountDetailViewController.h"

@interface BankAccountLoginViewController ()

@end

@implementation BankAccountLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginAction:(id)sender {
    NSString * _Nullable userName = self.userNameTextField.text;
    
    if ([userName length] > 0) {
        BankAccount * bankAccount = [BankAccountService getAccountWithUserName:userName];
        if (bankAccount == nil) {
            [BankAccountService addAccountWithUserName:userName];
            bankAccount = [BankAccountService getAccountWithUserName:userName];
        }
        
        BankAccountDetailViewController * vc = [[BankAccountDetailViewController alloc] initWithBankAccount:bankAccount];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


@end
