//
//  RGMovementViewController.h
//  RGBankAccount
//
//  Created by Roman Guarino on 01/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <RGBankAccountLib/RGBankAccountLib-Swift.h>

@interface RGMovementViewController : UIViewController

- (instancetype) initWithModel:(NSArray<RGMovement *> *) arrayModels;

@end
