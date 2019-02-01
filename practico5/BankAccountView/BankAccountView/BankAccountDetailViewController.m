//
//  BankAccountDetailViewController.m
//  BankAccountView
//
//  Created by VICTOR ABEL CABEZA on 01/02/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import "BankAccountDetailViewController.h"
#import <BankApi/BankApi-Swift.h>

@interface BankAccountDetailViewController ()

@end

@implementation BankAccountDetailViewController

- (instancetype)initWithBankAccount: (BankAccount*) bankAccount
{
    self = [super init];
    if (self) {
        self.bankAccount = bankAccount;
        self.negativeColorList =[NSArray arrayWithObjects:
                              UIColor.whiteColor,
                              UIColor.redColor,
                              UIColor.blackColor,
                              UIColor.grayColor,
                              UIColor.greenColor,
                              UIColor.blueColor,
                              UIColor.brownColor,
                              UIColor.darkGrayColor,
                              UIColor.cyanColor,
                              nil];
        
        
        self.negativeColor = UIColor.redColor;
        self.positiveColor = UIColor.whiteColor;
        
    }
    return self;
}

- (NSString * _Nonnull)formatedBalance {
    return [NSString stringWithFormat:@"$ %.2f", [self.bankAccount balance]];
}

- (void)refreshData {
    self.accountNumberLabel.text = [NSString stringWithFormat:@"Account Number: %lu", [self.bankAccount getAccountNumber]] ;
    self.userNameLabel.text = [NSString stringWithFormat:@"User Name: %@", [self.bankAccount getUserName]] ;
    self.balanceLabel.text = [self formatedBalance];
    
    [self.movementTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movementTableView.delegate = self;
    self.movementTableView.dataSource = self;
    [self refreshData];
}
- (IBAction)addMovementAction:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Movement"
                                          message:@"Put a new movement amount"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Movement";
         textField.keyboardType = UIKeyboardTypeNumberPad;
     }];
    
    
    UIAlertAction *actionCancel = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
    
    UIAlertAction *actionOK = [UIAlertAction
                               actionWithTitle:@"Add Movement"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *login = alertController.textFields.firstObject;
                                   
                                   [self addMovement:[[login text] doubleValue]];
                               }];
    
    [alertController addAction:actionCancel];
    [alertController addAction:actionOK];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
 
}

- (void) addMovement:(double) value {
    NSLog(@"add movement");
    BankAccountMovement *bankAccountMovement = [[BankAccountMovement alloc] initWithAmount:value date:[[NSDate alloc] init]];
    [self.bankAccount updateAccount:bankAccountMovement];
    [self refreshData];
    [self selectBalanceColor];
}

- (UIAlertAction * _Nonnull)coloredButtonBy:(UIColor *)color {
    UIAlertAction * _Nonnull button = [UIAlertAction
                                              actionWithTitle:[self formatedBalance]
                                              style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction *action)
                                              {
                                                  [self changeErrorColor:color];
                                              }];
    [button setValue:color forKey:@"titleTextColor"];

    return button;
}

- (IBAction)configureColorAction:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Change negative color"
                                          message:@"Choose a new negative color"
                                          preferredStyle:UIAlertControllerStyleAlert];
    

    
    UIAlertAction *actionCancel = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
    
    
    for (id color in self.negativeColorList){
        UIAlertAction *action= [self coloredButtonBy:color];
        [alertController addAction:action];
    }
    
    [alertController addAction:actionCancel];
    
    
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)selectBalanceColor {
    if([self.bankAccount balance] < 0){
        self.balanceLabel.textColor = self.negativeColor;
    } else {
        self.balanceLabel.textColor = self.positiveColor;
    }
}

- (void) changeErrorColor:(UIColor *) color {
    self.negativeColor = color;
    [self selectBalanceColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [[self.bankAccount movementListWithAsc:true] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellId = @"SimpleTableId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    BankAccountMovement *movement = [[self.bankAccount movementListWithAsc:true] objectAtIndex:indexPath.row];
    NSString *stringForCell = [NSString stringWithFormat:@"%@ - $ %2.f", [self formatDate:[movement getDate]], [movement getAmount]];
    
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)formatDate: (NSDate *) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-YYYY"];
    return[formatter stringFromDate:date];
}

@end
