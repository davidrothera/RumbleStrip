//
//  RumbleStrip.h
//  Pods
//
//  Created by David Rothera on 14/06/2015.
//
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

#import "UIWindow+Rumble.h"

@interface RumbleStrip : NSObject <MFMailComposeViewControllerDelegate, UIActionSheetDelegate>

+ (instancetype)enableRumble;
- (void)setRecipients:(NSArray *)recipients;
- (void)setSubject:(NSString *)subject;

@property (strong, atomic) NSArray *recipients;
@property (strong, atomic) NSString *subject;
@property (strong, atomic) NSData *screenshot;

@end
