//
//  MAOModalViewController.m
//  MyAppOne
//
//  Created by Metricas on 18/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOModalViewController.h"
#import "MAOListViewControllerModel.h"

@interface MAOModalViewController ()
@property (nonatomic, strong) MAOListViewControllerModel *arrayModels;
@end

@implementation MAOModalViewController

- (instancetype) initWithModel:(MAOListViewControllerModel *) arrayModels{
    self = [super init];
    if(self){
        _arrayModels = arrayModels;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistNameLabel.text = self.arrayModels.artistName;
    self.albumNameLabel.text = self.arrayModels.collectionName;
    self.trackNameLabel.text = self.arrayModels.trackName;
    NSData *image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.arrayModels.artworkUrl100]];
    self.albumArtUIImageView.image = [UIImage imageWithData:image];
    
}
- (IBAction)closeButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
