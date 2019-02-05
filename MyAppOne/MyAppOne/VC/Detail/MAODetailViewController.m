//
//  MAODetailViewController.m
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAODetailViewController.h"
#import "../../Model/MAOListViewControllerModel.h"

@interface MAODetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTrackName;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumName;
@property (weak, nonatomic) IBOutlet UILabel *lblAutorName;
@property (weak, nonatomic) IBOutlet UIImageView *imgAlbum;
@property (weak, nonatomic) IBOutlet UILabel *lblPriceTrack;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) MAOListViewControllerModel *model;
@end

@implementation MAODetailViewController

- (instancetype) initWithModel:(MAOListViewControllerModel *) model {
    self = [super init];
    if(self){
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.80];
    _contentView.layer.cornerRadius = 10;
    
    _lblTrackName.text = _model.trackName;
    _lblAlbumName.text = _model.collectionName;
    _lblAutorName.text = _model.artistName;
    _lblPriceTrack.text = [NSString stringWithFormat:@"$ %@", _model.trackPrice];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.artworkUrl100]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgAlbum.image = [UIImage imageWithData:data];
        });
    });
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.anyObject.view != self.contentView) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)btnClose:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBuy:(UIButton *)sender {
    [[UIApplication sharedApplication]
       openURL:[NSURL URLWithString:_model.previewUrl] options:@{} completionHandler:nil];
}

@end
