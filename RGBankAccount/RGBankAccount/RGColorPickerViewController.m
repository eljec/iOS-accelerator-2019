//
//  RGColorPickerViewController.m
//  RGBankAccount
//
//  Created by Roman Guarino on 05/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

#import "RGColorPickerViewController.h"
#import "FCColorPickerViewController.h"

@interface RGColorPickerViewController () <FCColorPickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, copy) UIColor *color;
@property (weak, nonatomic) IBOutlet UIButton *colorBalance;
@property (weak, nonatomic) IBOutlet UIButton *colorPositiveMovement;
@property (weak, nonatomic) IBOutlet UIButton *colorNegativeMovement;
@end

@implementation RGColorPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.80];
    _contentView.layer.cornerRadius = 10;
}

- (IBAction)buttonBalance:(UIButton *)sender {
    [self presentPicker];
}

- (IBAction)buttonPositiveMovement:(UIButton *)sender {
    [self presentPicker];
}

- (IBAction)buttonNegativeMovement:(UIButton *)sender {
    [self presentPicker];
}

- (void)colorPickerViewController:(FCColorPickerViewController *)colorPicker
                   didSelectColor:(UIColor *)color {
    self.color = color;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setColor:(UIColor *)color {
    _color = [color copy];
    [self.view setBackgroundColor:_color];
}

- (IBAction)buttonClouse:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.anyObject.view != self.contentView) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void) presentPicker {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPickerWithColor:self.color
                                                                                        delegate:self];
    colorPicker.tintColor = [UIColor whiteColor];
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker
                       animated:YES
                     completion:nil];
}

@end
