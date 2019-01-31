//
//  MAOModalViewController.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOModalViewController.h"
#import "MAOListViewControllerModel.h"
#import "MAOService.h"

@interface MAOModalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *modalPrice;
@property (weak, nonatomic) IBOutlet UILabel *modalArtist;
@property (weak, nonatomic) IBOutlet UILabel *modalAlbum;
@property (weak, nonatomic) IBOutlet UILabel *modalTrack;

@property (weak, nonatomic) IBOutlet UIView *modalContentView;
@property (weak, nonatomic) IBOutlet UIButton *modalBuyButton;
@property (weak, nonatomic) IBOutlet UIImageView *modalImageView;
@property (nonatomic) MAOListViewControllerModel *model;
@end

@implementation MAOModalViewController

-(instancetype)initWithModel:(MAOListViewControllerModel *)model{
    self = [super init];
    if (self){
        _model = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.60];
    self.modalContentView.layer.cornerRadius = 10.0;
    self.modalBuyButton.backgroundColor = self.modalBuyButton.tintColor;
    self.modalBuyButton.tintColor = [UIColor whiteColor];
    self.modalBuyButton.layer.cornerRadius = 3.0;
    
    // Set Data Properties
    self.modalTrack.text = self.model.trackName;
    self.modalAlbum.text = self.model.collectionName;
    self.modalArtist.text = self.model.artistName;
    self.modalPrice.text = [NSString stringWithFormat:@"$%.2f", [self.model.trackPrice doubleValue]];
    
    // Set Url de la imagen
    NSString *urlImage = self.model.artworkUrl100;
    
    __weak typeof(self) weakSelf = self;
    [[[MAOService alloc] init] fetchImageFromUrl:urlImage withCompletionBlock:^(UIImage *image) {
        weakSelf.modalImageView.image = image;
    }];
    
}

- (IBAction)dismissModal:(UIControl *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)comprarTrack:(UIButton *)sender {
    // Abrir el preview en un navegador
    NSURL* url = [[NSURL alloc] initWithString: self.model.previewUrl];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
