//
//  MLNetworking.h
//  Pods
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNetworking : NSObject

typedef void (^SuccessRequest) (NSData *, NSURLResponse *);
typedef void (^ErrorRequest) (NSError *);

-(void) fetchUrlWithString:(NSString *)strUrl onSuccess:
(SuccessRequest)onSuccess onError:(ErrorRequest) onError;

@end

NS_ASSUME_NONNULL_END
