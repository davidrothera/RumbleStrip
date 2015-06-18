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
    RumbleStrip *strip = [RumbleStrip enableRumble];
    [strip setSubject:@"Rumble Strip - Test feedback"];
    [strip setRecipients:@[ @"test@email.com" ]];

    return YES;
}

@end
