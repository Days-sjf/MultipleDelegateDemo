//
//  MultipleDelegate.m
//  MultipleDelegateDemo
//
//  Created by slyao on 15/12/9.
//  Copyright © 2015年 slyao. All rights reserved.
//

#import "MultipleDelegate.h"

@implementation MultipleDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegates = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (id target in self.delegates) {
            if ((signature = [target methodSignatureForSelector:aSelector])) {
                break;
            }
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    for (id target in self.delegates) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    for (id target in self.delegates) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

@end
