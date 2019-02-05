//
//  CBInitViewController.m
//  CuentaBancariaUI
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "CBInitViewController.h"
#import "CBMovementTableController.h"
#import <CuentaBancariaLIB/CuentaBancariaLIB-Swift.h>

@interface CBInitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation CBInitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [[UIImage imageNamed:@"plus"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *imageFilled = [[UIImage imageNamed:@"plus-filled"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.addButton setImage:image forState:UIControlStateNormal];
    [self.addButton setImage:imageFilled forState:UIControlStateHighlighted];
    self.addButton.tintColor = self.view.tintColor;
    
    self.amountTextField.delegate = self;
    
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
    [self textFieldShouldReturn:self.amountTextField];
    NSString *amountString = self.amountTextField.text;
    if (![amountString  isEqual: @""]){
        double amount = [amountString doubleValue];
        
        CBTransaction *transaction = [[CBTransaction alloc] initWithAmount: amount];
        [CBCuenta addWithTransaccion: transaction];
        
        self.amountTextField.text = nil;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)goToMovementTable:(UIButton *)sender {
    CBMovementTableController *vc = [[CBMovementTableController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
