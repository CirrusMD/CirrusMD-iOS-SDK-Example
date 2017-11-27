//
//  CMDAppDelegate.m
//  CirrusMDSDK
//
//  Created by steam on 11/25/2017.
//  Copyright (c) 2017 steam. All rights reserved.
//

#import "CMDAppDelegate.h"
#import "CirrusMDSDK/CirrusMDSDK-Swift.h"

@interface CMDAppDelegate ()
@property UIView *errorView;
@end

@implementation CMDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //    {
    //        "alg": "HS256",
    //        "typ": "JWT"
    //    }
    //    {
    //        "accessToken": "c2b1325765557ff37a5f6acce0c89453c12e5fe577bd88585849f935e7e6faf2",
    //        "sub": "1234567890",
    //        "name": "Mae Hammond",
    //        "apiRootURL": "https://staging.cirrusmd.com",
    //        "sdkID": "1234-5678",
    //        "webSocketURL": "https://ws-staging.cirrusmd.com",
    //        "exp": 64092211200
    //    }


    // Mae Hammond
    NSString *jwt = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NUb2tlbiI6ImMyYjEzMjU3NjU1NTdmZjM3YTVmNmFjY2UwYzg5NDUzYzEyZTVmZTU3N2JkODg1ODU4NDlmOTM1ZTdlNmZhZjIiLCJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ik1hZSBIYW1tb25kIiwiYXBpUm9vdFVSTCI6Imh0dHBzOi8vc3RhZ2luZy5jaXJydXNtZC5jb20iLCJzZGtJRCI6IjEyMzQtNTY3OCIsIndlYlNvY2tldFVSTCI6Imh0dHBzOi8vd3Mtc3RhZ2luZy5jaXJydXNtZC5jb20iLCJleHAiOjY0MDkyMjExMjAwfQ.YIPAeLs5le45cHqvNkoeK60AsrE1bws_ilyqLDBXK-w";

    NSString *secret = @"foobar";
    self.errorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.errorView.backgroundColor = [UIColor redColor];

    NSString* str = @"teststring";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];

    //    [CirrusMDSDKSession.singleton unregisterforRemoteNotifications];
    [CirrusMDSDKSession.singleton registerforRemoteNotifications: data];
    //    CirrusMDSDKSession.singleton.delegate = self;
    [CirrusMDSDKSession.singleton setToken:jwt
                                withSecret:secret
                                completion:^(CirrusMDSDKSessionResult result)
     {
         NSLog(@"CirrusMDSDKSession: code: %ld", (long)result);
     }];

//    [Fabric with:@[[Crashlytics class]]];
    return YES;
}

@end
