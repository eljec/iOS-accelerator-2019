#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PSItunesSongService.h"
#import "PSSongService.h"
#import "PSItunesSong.h"
#import "PSSong.h"
#import "NSString+NSString_UrlEncoding.h"

FOUNDATION_EXPORT double PSSongApiVersionNumber;
FOUNDATION_EXPORT const unsigned char PSSongApiVersionString[];

