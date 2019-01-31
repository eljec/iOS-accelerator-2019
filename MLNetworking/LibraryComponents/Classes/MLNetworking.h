//
//  MLNetworking.h
//  Pods
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNetworking : NSObject

-(void) fetchUrlWithString:(NSString *)strUrl onSuccess:
(void(^)(NSData *data, NSURLResponse *urlResponse))onSuccess onError:(void(^)(NSError * error)) onError;

-(void) fetchImageFromUrl:(NSString *)url onSuccess:(void(^)(UIImage *image))onSuccess;

@end

NS_ASSUME_NONNULL_END
