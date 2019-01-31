//
//  MLNViewController.m
//  MLNetworking
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "MLNViewController.h"
#import <MLNetworking/MLNetworking.h>
#import <MLNetworking/MLNHandlerError.h>

#define ML_URL @"https://api.mercadolibre.com/sites/"
#define IMAGE_URL @"https://www.america-retail.com/static//2018/12/mercado-libre.jpg"

@interface MLNViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@end

@implementation MLNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hola");
    
    SuccessRequest success = ^void (NSData *data, NSURLResponse *response) {
        
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"%@", json);
    };
    
    ErrorRequest error = ^void (NSError *error){
        MLNHandlerError * handler = [[MLNHandlerError alloc] init];
        [handler handlerError:error controller:self];
    };
    
    
    MLNetworking* service = [[MLNetworking alloc] init];
    [service fetchUrlWithString:ML_URL onSuccess:success onError:error];
    
    ImageRequest image = ^void (UIImage *image){
        if (image != nil){
            self.testImageView.image = image;
        } else {
            self.testImageView.image = [UIImage imageNamed:@"error"];
        }
    };
    
    MLNetworking* service2 = [[MLNetworking alloc] init];
    [service2 fetchImageFromUrl:IMAGE_URL onSuccess:image];
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
