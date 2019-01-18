//
//  MAOService.h
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAOListViewControllerModel.h"


@interface MAOService : NSObject

-(void) fetchJsonWithCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionBlock url:(NSString *) url;

-(NSArray<MAOListViewControllerModel *> *) parserJson:(NSData *) json;
@end

