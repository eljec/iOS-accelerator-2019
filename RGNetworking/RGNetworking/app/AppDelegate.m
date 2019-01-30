#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.window setRootViewController:[[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]]];
	[self.window makeKeyAndVisible];
	return YES;
}

@end