//
//  CustomSongDetailViewController.m
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "CustomSongDetailViewController.h"

@interface CustomSongDetailViewController ()

@end

@implementation CustomSongDetailViewController

-(id) initWithModel:(MAOListViewControllerModel *)model{
    self = [super init];
    if(self){
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.trackNameLabel.text = [NSString stringWithFormat:@"Track: %@", self.model.trackName];
    self.albumNameLabel.text = [NSString stringWithFormat:@"Album: %@", self.model.collectionName];
    self.authorNameLabel.text = [NSString stringWithFormat:@"Author: %@", self.model.artistName];
    self.trackPriceLabel.text = [NSString stringWithFormat:@"Price: $ %@", [self.model.trackPrice stringValue]];
    dispatch_queue_t dispatchImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(dispatchImage, ^{
        NSURL *dataURL = [NSURL URLWithString:self.model.artworkUrl100];
        NSData *albumImage = [NSData dataWithContentsOfURL:dataURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.trackImage.image = [UIImage imageWithData:albumImage];
        });
    });
    ;
}
- (IBAction)closeModal:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)buyTrack:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.model.trackViewUrl] options:@{} completionHandler:nil];
}


@end
