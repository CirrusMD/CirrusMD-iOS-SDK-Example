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

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //    Notifications sent by CirrusMD have the following shape:
    //    {
    //        aps =     {
    //            alert = "You have a new message.";
    //            badge = 1;
    //            sound = default;
    //        };
    //        "custom_data" =     {
    //            event = "message:new";
    //            "owner_id" = 1234;
    //            "stream_id" = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
    //        };
    //    }
    NSLog(@"Remote notification received: %@", userInfo);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)application:(UIApplication *)app
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    [CirrusMDSDKSession.singleton registerforRemoteNotifications:devToken];
}

- (void)application:(UIApplication *)app
didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Remote notification support is unavailable due to error: %@", err);
}

@end
