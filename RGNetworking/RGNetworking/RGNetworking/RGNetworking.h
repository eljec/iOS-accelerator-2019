#import <Foundation/Foundation.h>

@interface RGNetworking : NSObject
    
+(void) fetchDataFromUrl:(NSURL *)url success:(void (^)(NSData *data))onSuccess error:(void (^)(NSError *error))onError;
    
@end
