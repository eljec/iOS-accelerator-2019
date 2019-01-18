//
//  MAOModalViewController.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOModalViewController.h"
#import "MAOListViewControllerModel.h"


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
    
    // Set Properties
    NSLog(@"DATO: %@", self.model.artistName);
    self.modalTrack.text = self.model.trackName;
    self.modalAlbum.text = self.model.collectionName;
    self.modalArtist.text = self.model.artistName;
    self.modalPrice.text = [NSString stringWithFormat:@"$%.2f", [self.model.trackPrice doubleValue]];
    
    // Url de la imagen
    NSString *urlImage = self.model.artworkUrl100;
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Obtengo la imagen en bytes
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlImage]];
        dispatch_async(dispatch_get_main_queue(), ^{
            typeof(self) strongSelf = weakSelf;
            if (strongSelf){
                strongSelf.modalImageView.image = [UIImage imageWithData:data];
            }
        });
    });
    
}

//-(void)setupWithModel:(id)model{
//
//}

- (IBAction)dismissModal:(UIControl *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)comprarTrack:(UIButton *)sender {
    NSLog(@"Comprar");
    

    NSURL* url = [[NSURL alloc] initWithString: self.model.previewUrl];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
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
