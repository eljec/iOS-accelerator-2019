//
//  main.m
//  PSSongApi
//
//  Created by VICTOR ABEL CABEZA on 30/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSSongService.h"
#import "PSItunesSongService.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"hello");
        
        id <PSSongService> psSongService = [[PSItunesSongService alloc] init];
        
        [psSongService getSongsByQuery:@"soda stereo" andOrderBy:trackName andAsc:YES andCompletition:^(NSArray *songsArray) {
            NSLog(@"exito %lu", songsArray.count);
        } andError:^(NSError *error) {
            NSLog(@"error");
        }];
        
        sleep(2000);
        
        return 0;
    }
}
