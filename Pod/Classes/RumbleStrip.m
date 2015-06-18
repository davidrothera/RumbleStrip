//
//  RumbleStrip.m
//  Pods
//
//  Created by David Rothera on 14/06/2015.
//
//

#import "RumbleStrip.h"

@interface RumbleStrip ()

- (void)subscribeToShakes;
- (void)giveFeedback;
- (NSString *)getDeviceInfo;
- (NSData *)takeScreenshot;

@end

@implementation RumbleStrip

#pragma mark - Singleton
+ (instancetype)enableRumble {
    static RumbleStrip *rumbleStrip;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rumbleStrip = [[self alloc] init];
        rumbleStrip.subject = @"Feedback";
        rumbleStrip.recipients = @[];
    });
    return rumbleStrip;
}

#pragma mark - Init methods
- (instancetype)init {
    if (self = [super init]) {
        [self subscribeToShakes];
    }
    return self;
}

#pragma mark - Instance methods
- (void)subscribeToShakes {
    [[NSNotificationCenter defaultCenter] addObserverForName:@"RSTShake"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [self handleShake];
                                                  }];
}

- (void)handleShake {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    UIViewController *rootController = [[[UIApplication sharedApplication] keyWindow] rootViewController];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Would you like to give feedback?"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Yes"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action) {
                                                   [self giveFeedback];
                                               }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];

    [alertController addAction:ok];
    [alertController addAction:cancel];

    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    [popover setSourceView:rootController.view];
    CGPoint center = rootController.view.center;
    CGRect rect = CGRectMake(center.x, center.y, 0, 0);
    [popover setSourceRect:rect];
    popover.permittedArrowDirections = 0;

    [rootController presentViewController:alertController animated:YES completion:nil];
}

- (NSData *)takeScreenshot {
    UIScreen *screen = [UIScreen mainScreen];
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];

    UIGraphicsBeginImageContextWithOptions(screen.bounds.size, NO, 0);
    [keyWindow drawViewHierarchyInRect:keyWindow.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *data = UIImagePNGRepresentation(image);

    return data;
}

- (void)giveFeedback {
    NSData *screenshot = [self takeScreenshot];
    if ([MFMailComposeViewController canSendMail] == NO) {
        NSLog(@"Uh oh!");
        return;
    }

    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    UIViewController *rootController = [[[UIApplication sharedApplication] keyWindow] rootViewController];

    [mailController setSubject:self.subject];
    [mailController setToRecipients:self.recipients];
    [mailController setMailComposeDelegate:self];
    [mailController setMessageBody:[self getDeviceInfo] isHTML:NO];
    [mailController addAttachmentData:screenshot mimeType:@"image/png" fileName:@"screenshot.png"];
    [rootController presentViewController:mailController animated:YES completion:nil];
}

- (NSString *)getDeviceInfo {
    NSMutableString *info = [[NSMutableString alloc] init];

    [info appendString:@"NOTE: Please leave the below information intact\n\n"];

    NSString *appBuildString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    NSString *appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *versionBuildString = [NSString stringWithFormat:@"Version: %@ (%@)\n", appVersionString, appBuildString];
    [info appendString:versionBuildString];

    UIDevice *device = [UIDevice currentDevice];
    [info appendString:@"Device info:\n"];
    [info appendFormat:@"   System Name: %@\n", device.systemName];
    [info appendFormat:@"   System Version: %@\n", device.systemVersion];
    [info appendFormat:@"   Model: %@\n", device.model];
    [info appendFormat:@"   UUID: %@\n", [device.identifierForVendor UUIDString]];

    return info;
}

#pragma mark - Mail delegate methods
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    if (result != MFMailComposeResultSent) {
        NSLog(@"The mail wasn't sent");
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
