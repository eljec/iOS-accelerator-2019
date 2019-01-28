//
//  MAOListWithColumnsViewController.m
//  MyAppOne
//
//  Created by Marcio Mortarino on 12/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListWithColumnsViewController.h"

@implementation MAOListWithColumnsViewController

@property (strong, nonatomic) UIView *divider1;
@property (strong, nonatomic) UIView *divider2;

- (NSString *)label {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:label];
    return label;
}

- (NSString *)divider {
    UIView *view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1.0/[[UIScreen mainScreen] scale]]];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:view];
    return view;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.separatorInset = UIEdgeInsetsZero;
    self.layoutMargins = UIEdgeInsetsZero;
    self.preservesSuperviewLayoutMargins = NO;
    
    self.divider1 = [self divider];
    self.divider2 = [self divider];
    
    self.label1 = [self label];
    self.label2 = [self label];
    self.label3 = [self label];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_label1, _label2, _label3, _divider1, _divider2);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_label1]-2-[_divider1]-2-[_label2(==_label1)]-2-[_divider2]-2-[_label3(==_label1)]-5-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    [self.contentView addConstraints:constraints];
    
    NSArray *horizontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_divider1]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:horizontalConstraints1];
    NSArray *horizontalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_divider2]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:horizontalConstraints2];
    
    return self;
}

@end
