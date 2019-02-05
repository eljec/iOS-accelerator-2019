//
//  CBMovementCell.m
//  CuentaBancariaUI
//
//  Created by Pedro Eduardo Waquim on 04/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "CBMovementCell.h"

@interface CBMovementCell()
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@end

@implementation CBMovementCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) cargar: (CBTransaction *)transaction{
    self.amountLabel.text = [NSString stringWithFormat: @"$ %.2f", transaction.amount];
}

@end
