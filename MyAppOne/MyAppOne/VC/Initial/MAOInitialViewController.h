//
//  MAOInitialViewController.h
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"

@interface MAOInitialViewController : UIViewController
-(NSArray<MAOListViewControllerModel *> *) ordenarPorTrack:(NSArray<MAOListViewControllerModel *> *)array;

-(NSArray<MAOListViewControllerModel *> *) ordenarPorFecha:(NSArray<MAOListViewControllerModel *> *)array;

-(NSArray<MAOListViewControllerModel *> *) ordenarInvertido:(NSArray<MAOListViewControllerModel *> *)array;
@end

