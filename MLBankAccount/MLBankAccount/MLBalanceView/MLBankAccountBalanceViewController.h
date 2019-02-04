//
//  MLBankAccountBalanceViewController.h
//  MLBankAccount
//
//  Created by Marcio Mortarino on 04/02/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLBankAccountViewController.h"
#import "MLBankMovementsLib-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLBankAccountBalanceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWith:(NSArray<Account *> *)accounts;

@end

NS_ASSUME_NONNULL_END
