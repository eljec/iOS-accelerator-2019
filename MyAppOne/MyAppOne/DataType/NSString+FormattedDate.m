//
//  NSString+FormattedDate.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 11/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "NSString+FormattedDate.h"

@implementation NSString(FormattedDate)
+(NSDate *) formattedString:(NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSDate *date = [formatter dateFromString:dateString];
    NSLog(@"date: %@", date);
    return date;
}
@end
