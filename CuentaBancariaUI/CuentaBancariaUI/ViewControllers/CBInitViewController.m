//
//  CBInitViewController.m
//  CuentaBancariaUI
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "CBInitViewController.h"
#import <CuentaBancariaLIB/CuentaBancariaLIB-Swift.h>

@interface CBInitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;

@end

@implementation CBInitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.amountTextField.delegate = self;
    self.amountTextField.text = [NSString stringWithFormat:@"0"];

    [CBCuenta chooseErrorColorWithColor: CBErrorColorRED];
    [self showBalance:nil];
    // Do any additional setup after loading the view.
}

- (IBAction)showBalance:(UIButton *)sender {
    double value = [CBCuenta showBalance];
    
    if (value < 0){
        self.balanceLabel.textColor = [CBCuenta wichColorError];
    } else {
        self.balanceLabel.textColor = [UIColor blackColor];
    }
    
    self.balanceLabel.text = [NSString stringWithFormat:@"$ %.2f", value];
}

- (IBAction)addAmount:(UIButton *)sender {
    NSString *amountString = self.amountTextField.text;
    double amount = [amountString doubleValue];
    
    CBTransaction *transaction = [[CBTransaction alloc] initWithAmount: amount];
    [CBCuenta addWithTransaccion: transaction];
    
    self.amountTextField.text = [NSString stringWithFormat:@"0"];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
