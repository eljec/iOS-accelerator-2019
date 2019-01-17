//
//  MAOSongListController.h
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"


/**
 Model List Controller interface.
 */
@interface MAOSongListController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *mainTable;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;
@property (strong, nonatomic) UINavigationBar *navigationBar;

@property (nonatomic, strong) NSArray<MAOListViewControllerModel *> *arrayModels;

- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels;

@end
