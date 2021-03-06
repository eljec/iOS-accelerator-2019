//
//  MAOListViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewController.h"


/**
 Model List controller Implementation.
 */
@interface MAOListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *resultTable;
@property (nonatomic, strong) NSArray<MAOListViewControllerModel *> *arrayModels;
@end

@implementation MAOListViewController


/**
 Initialization of view with model.

 @param arrayModels array of MAOListViewControllerModel
 @return instancetype
 */
- (instancetype) initWithModel:( NSArray<MAOListViewControllerModel *> *) arrayModels
{
    self = [super init];
    if(self){
        _arrayModels = arrayModels;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultTable.delegate = self;
    self.resultTable.dataSource = self;
    [self.resultTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier   forIndexPath:indexPath] ;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    MAOListViewControllerModel *rowObject = [self.arrayModels objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    cell.textLabel.text= [NSString stringWithFormat:@"%@ | %@" , rowObject.trackName?:@"", [dateFormatter stringFromDate: rowObject.releaseDate]] ;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
