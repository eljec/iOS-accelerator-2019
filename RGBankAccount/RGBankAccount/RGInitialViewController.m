//
//  RGInitialViewController.m
//  RGBankAccount
//
//  Created by Roman Guarino on 31/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

#import "RGInitialViewController.h"
#import <RGBankAccountLib/RGBankAccountLib-Swift.h>
#import "ProgressHUD.h"
#import "RGMovementViewController.h"

@interface RGInitialViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *txtAmount;
    @property (weak, nonatomic) IBOutlet UILabel *lblAmount;
    @property RGBankAccount *bankAccount;
    @property RGAccount *account;
@end

@implementation RGInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cuenta Bancaria";
    _bankAccount = [[RGBankAccount alloc] init];
    _account = [_bankAccount getAccount];
    [self refreshBalance];
    
    UIBarButtonItem *moreButtom = [[UIBarButtonItem alloc] initWithTitle:@"Mas" style:UIBarButtonItemStylePlain target:self action:@selector(showOption)];
    self.navigationItem.rightBarButtonItem = moreButtom;
}

- (void)showOption {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Movimientos detallados" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        RGMovementViewController *listView = [[RGMovementViewController alloc] initWithModel:[self.account movement]];
        [self.navigationController pushViewController:listView animated:YES];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Editar colores" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [ProgressHUD showError:@"Función no implementada"];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Eliminar cuenta" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        if([self.bankAccount clearAccount]) {
            [ProgressHUD showSuccess:@"Cuenta eliminada con éxito"];
            self.account = [self.bankAccount getAccount];
            [self refreshBalance];
        } else {
            [ProgressHUD showError:@"Ocurrió un error"];
        }
        [self dismissViewControllerAnimated:YES completion:^{}];
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (IBAction)btnOperar:(UIButton *)sender {
    NSString *valueString = self.txtAmount.text;
    if([valueString length] == 0) {
        [ProgressHUD showError:@"Primero debes ingresar un valor"];
    } else {
        _account = [_bankAccount doMovementAccountWithValue: [self.txtAmount.text floatValue]];
        [self refreshBalance];
        self.txtAmount.text = nil;
    }
}

- (void) refreshBalance {
    self.lblAmount.text = [NSString stringWithFormat:@"$%.02f", [_account balance]];
}

@end
