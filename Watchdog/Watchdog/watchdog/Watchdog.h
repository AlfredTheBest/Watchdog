//
//  Watchdog.h
//  Watchdog
//
//  Created by Jack on 16/8/31.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Watchdog : NSObject


/**
 Initializes an instance of a watch dog to keep monitoring main thread.
 
 @param threshold the time interval for watching.
 
 @param strict customize reaction.

 @return An initialized watch dog, actively monitoring the main thread.
 */
- (instancetype)initWithThreshold:(double)threshold
                    andStrictMode:(BOOL) strict;

@end
