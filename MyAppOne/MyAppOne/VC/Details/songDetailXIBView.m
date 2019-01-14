//
//  songDetailXIBView.m
//  MyAppOne
//
//  Created by Gonzalo Alexis Quarin on 12/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "songDetailXIBView.h"

@interface songDetailXIBView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *trackIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;

@end

@implementation songDetailXIBView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void) customInit{
    [[NSBundle mainBundle] loadNibNamed:@"songDetailXIB" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    
}

@end
