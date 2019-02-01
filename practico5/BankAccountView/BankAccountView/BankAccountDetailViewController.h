//
//  BankAccountDetailViewController.h
//  BankAccountView
//
//  Created by VICTOR ABEL CABEZA on 01/02/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BankApi/BankApi-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface BankAccountDetailViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>

@property (weak, nonatomic) BankAccount *bankAccount;
@property (weak, nonatomic) IBOutlet UILabel *accountNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) UIColor *negativeColor;
@property (weak, nonatomic) UIColor *positiveColor;
@property (strong, nonatomic) NSArray<UIColor *> *negativeColorList;
@property (weak, nonatomic) IBOutlet UITableView *movementTableView;

- (instancetype)initWithBankAccount: (BankAccount*) bankAccount;

@end

NS_ASSUME_NONNULL_END
