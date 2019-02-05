//
//  CBMovementCell.h
//  CuentaBancariaUI
//
//  Created by Pedro Eduardo Waquim on 04/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CuentaBancariaLIB/CuentaBancariaLIB-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBMovementCell : UITableViewCell
-(void) cargar: (CBTransaction *)transaction;
@end

NS_ASSUME_NONNULL_END
