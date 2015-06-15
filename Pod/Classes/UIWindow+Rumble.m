//
//  UIWindow+Rumble.m
//  Pods
//
//  Created by David Rothera on 14/06/2015.
//
//

#import "UIWindow+Rumble.h"

@implementation UIWindow (Rumble)

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventTypeMotion && motion == UIEventSubtypeMotionShake) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RSTShake" object:self];
    }
}

@end
