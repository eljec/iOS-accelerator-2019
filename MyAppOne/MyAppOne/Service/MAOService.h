//
//  MAOService.h
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MAOListViewControllerModel.h"


@interface MAOService : NSObject

-(void) fetchJsonWithCompletionBlock:(void(^)(NSData *data, NSURLResponse *urlResponse))completionBlock errorBlock:(void(^)(NSError *error))errorBlock url:(NSString *)url;

-(NSArray<MAOListViewControllerModel *> *) parserJson:(NSData *) json;

-(void) fetchImageFromUrl:(NSString *)url withCompletionBlock:(void(^)(UIImage *image))completionBlock;
@end

