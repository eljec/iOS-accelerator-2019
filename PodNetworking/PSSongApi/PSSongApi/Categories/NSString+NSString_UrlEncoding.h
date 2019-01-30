//
//  NSString+NSString_UrlEncoding.h
//  MyAppOne
//
//  Created by VICTOR ABEL CABEZA on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Category interface to get url encoded string.
 */
@interface NSString (NSString_UrlEncoding)
/**
 Return the url encoded string.
 
 @return urlEncoded
 */
-(NSString *)urlencode;
@end
