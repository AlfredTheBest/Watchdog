//
//  Watchdog.m
//  Watchdog
//
//  Created by Jack on 16/8/31.
//  Copyright © 2016年 Jack. All rights reserved.
//

typedef void (^block)(void);


#import "Watchdog.h"

#pragma mark - pingThread

@interface PingThread : NSThread

@property (nonatomic, assign) BOOL pingTaskIsRunning;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, assign) double threshold;
@property (nonatomic, strong) block handler;


@end

@implementation PingThread

- (instancetype)initWithThreshold:(double)threshold andHandler:(block)handler
{
    self = [super init];
    if (self) {
        self.threshold = 4.0;
        self.handler = handler;
        self.semaphore = dispatch_semaphore_create(0);
    }
    return self;
}


- (void) main
{
    while (!self.cancelled) {
        self.pingTaskIsRunning = true;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.pingTaskIsRunning = false;
            dispatch_semaphore_signal(self.semaphore);
        });
        
        [NSThread sleepForTimeInterval:self.threshold];
        if (self.pingTaskIsRunning)
        {
            self.handler();
        }
        
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    }
}

@end

#pragma mark - watching dog

@interface Watchdog ()

@property (nonatomic, strong) PingThread *pingThread;

@end

@implementation Watchdog

- (instancetype)initWithThreshold:(double)threshold andFiredCallback:(block)handler
{
    if (self = [super init]) {
        self.pingThread = [[PingThread alloc] initWithThreshold:4.0 andHandler:handler];
        [self.pingThread start];
        
        //TODO need fix alert
        [self performSelector:nil onThread:self.pingThread withObject:nil waitUntilDone:NO];
    }
    
    return self;
}

- (instancetype)initWithThreshold:(double)threshold andStrictMode:(BOOL)strict
{
    self =  [self initWithThreshold:threshold andFiredCallback:^{
        if (strict) {
            NSCAssert(0, @"the main thread has been blcoked");
        } else {
            NSLog(@"the main thread has been blcoked");
        }
    }];
    return self;
}

- (void)dealloc
{
    [self.pingThread cancel];
}


@end
