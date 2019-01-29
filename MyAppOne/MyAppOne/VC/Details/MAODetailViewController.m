//
//  MAODetailViewController.m
//  MyAppOne
//
//  Created by Gonzalo Alexis Quarin on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAODetailViewController.h"

@interface MAODetailViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UILabel *lblTrackName;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistName;
@property (weak, nonatomic) IBOutlet UILabel *lblCollectionName;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewTrackView;

@property (weak, nonatomic) MAOListViewControllerModel *controllerModel;

- (IBAction)dismiss:(UIButton *)sender;
- (IBAction)openUrl: (UIButton *)sender;

@end

@implementation MAODetailViewController

@synthesize imgViewTrackView;

- (instancetype) initWhitModel: (MAOListViewControllerModel *) model{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.90];
    self.contentView.layer.cornerRadius = 3.0;
    
    self.controllerModel = model;
    
    self.lblTrackName.numberOfLines = 1;
    self.lblTrackName.adjustsFontSizeToFitWidth = YES;
    
    self.lblCollectionName.numberOfLines = 1;
    self.lblCollectionName.adjustsFontSizeToFitWidth = YES;
    
    _lblTrackName.text = model.trackName;
    _lblArtistName.text = model.artistName;
    _lblCollectionName.text = model.collectionName;
    
    [self loadImage: model.artworkUrl100 toImgView: self.imgViewTrackView];
    
    return self;
}

//TODO Gonza: Mover a un helper
- (void) loadImage: (NSString *) url toImgView: (UIImageView *) imgView
{
    dispatch_queue_t dispatchImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(dispatchImage, ^{
        NSURL *dataURL =
        [NSURL URLWithString: url];
        NSData *flagImageData = [NSData dataWithContentsOfURL:dataURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imgView.image = [UIImage imageWithData:flagImageData];
        });
    });
}


- (IBAction)dismiss:(UIButton *)sender {
    [self dismissViewControllerAnimated:true
                             completion:nil];
}

- (IBAction)openUrl: (UIButton *)sender{
    NSLog(@"URL: %@", self.controllerModel.trackViewUrl);
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:self.controllerModel.previewUrl]
     options:@{} completionHandler:nil];
}

@end
