#import "ViewController.h"
#import "RGNetworking.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *textField;
    @property (weak, nonatomic) IBOutlet UITextView *textArea;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RGNetworking";
    self.textField.text = @"https://itunes.apple.com/search?term=jack+johnson";
}

- (IBAction)btnFetch:(UIButton *)sender {
    [RGNetworking fetchDataFromUrl:[NSURL URLWithString: self.textField.text] success:^(NSData *data) {
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", dataArray);
        self.textArea.text = [NSString stringWithFormat:@"%@", dataArray];
    } error:^(NSError *error) {
        self.textArea.text = error.localizedDescription;
    }];
}
    @end
