//
//  MLBankAccountViewController.h
//  MLBankAccount
//
//  Created by Marcio Mortarino on 31/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLBankAccountBalanceViewController.h"
#import "MLBankMovementsLib-Swift.h"


NS_ASSUME_NONNULL_BEGIN

@interface MLBankAccountViewController : UIViewController

@property (strong, nonatomic) NSArray<Account *> *account;

@end

NS_ASSUME_NONNULL_END
