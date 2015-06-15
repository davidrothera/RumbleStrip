//
//  rumbAppDelegate.m
//  RumbleStrip
//
//  Created by CocoaPods on 06/14/2015.
//  Copyright (c) 2014 David Rothera. All rights reserved.
//

#import "rumbAppDelegate.h"
#import <RumbleStrip/RumbleStrip.h>

@implementation rumbAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [RumbleStrip enableRumble];

    return YES;
}

@end
