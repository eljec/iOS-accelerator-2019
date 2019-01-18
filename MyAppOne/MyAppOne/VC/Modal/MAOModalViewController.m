//
//  MAOModalViewController.m
//  MyAppOne
//
//  Created by Marcio Mortarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOModalViewController.h"
#import "../List/MAOListViewControllerModel.h"

@interface MAOModalViewController ()

@property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceTrackLabel;
@property (weak, nonatomic) IBOutlet UIImageView *trackImage;
@property (weak, nonatomic) IBOutlet UIButton *purchaseButton;
@property (weak, nonatomic) IBOutlet UIView *modalView;
@property (nonatomic, strong) MAOListViewControllerModel *itemsForModal;

@end

@implementation MAOModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertiesOfModal];
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.60]];
}

- (instancetype)initWithModel:(MAOListViewControllerModel *)model {
    self = [super init];
    if(self){
        _itemsForModal = model;
    }
    return self;
}

- (void)propertiesOfModal {
    self.modalView.layer.cornerRadius = 6;
    self.modalView.layer.masksToBounds = YES;
    self.trackNameLabel.text = self.itemsForModal.trackName;
    self.collectionNameLabel.text = self.itemsForModal.collectionName;
    self.artistNameLabel.text = self.itemsForModal.artistName;
    self.priceTrackLabel.text = [NSString stringWithFormat:@"%@", [self.itemsForModal trackPrice]];
    [self.purchaseButton setTitle:[NSString stringWithFormat:@"Buy '%@' here", self.itemsForModal.trackName] forState:normal];
    dispatch_queue_t dispatchImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(dispatchImage, ^{
        NSURL *dataURL = [NSURL URLWithString:self.itemsForModal.artworkUrl100];
        NSData *albumImage = [NSData dataWithContentsOfURL:dataURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.trackImage.image = [UIImage imageWithData:albumImage];
        });
    });
}

- (IBAction)closeModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openUrlOnClick:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.itemsForModal.trackViewUrl] options:@{} completionHandler:nil];
}

@end
