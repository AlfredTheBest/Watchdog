//
//  Watchdog.h
//  Watchdog
//
//  Created by Jack on 16/8/31.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Watchdog : NSObject

- (instancetype)initWithThreshold:(double)threshold
                    andStrictMode:(BOOL) strict;

@end
