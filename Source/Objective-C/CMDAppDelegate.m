//
//  CMDAppDelegate.m
//  CirrusMDSDK
//
//  Created by CirrusMD.
//  Copyright (c) 2017 CirrusMD. All rights reserved.
//

#import "CMDAppDelegate.h"
#import "CirrusMDSDK/CirrusMDSDK-Swift.h"

@interface CMDAppDelegate ()
@end

@implementation CMDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)application:(UIApplication *)app
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    [CirrusMDSDKSession.singleton registerForRemoteNotifications:devToken];
}

- (void)application:(UIApplication *)app
didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Remote notification support is unavailable due to error: %@", err);
}

@end
