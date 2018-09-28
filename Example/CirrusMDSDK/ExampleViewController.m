//
//  FirstViewController.m
//  CirrusMDSDK
//
//  Created by CirrusMD.
//  Copyright (c) 2017 CirrusMD. All rights reserved.
//

#import "ExampleViewController.h"
#import "CirrusMDSDK/CirrusMDSDK-Swift.h"

@interface ExampleViewController ()
@property UIView *errorView;
@property UIView *loggedOutView;
@property NSString *secret;
@property NSString *sdkID;
@property NSString *serverToken;
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureSessionDelegate];
    [self styleNavigationBar];


    self.secret = @"eyJzaGFyZWRfc2VjcmV0IjoiZWFlZGZkYWMtZjBkYS00NGYxLTkxNDgtYTE3ZWQ4NDcxY2Q3IiwieDUwOV9jZXJ0X2RlciI6Ik1JSUQ4RENDQXRpZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREJjTVFzd0NRWURWUVFHRXdKVlV6RVdNQlFHQTFVRUNnd05RMmx5Y25WelRVUWdTVzVqTGpFVU1CSUdBMVVFQ3d3TFJXNW5hVzVsWlhKcGJtY3hEREFLQmdOVkJBTU1BMU5FU3pFUk1BOEdBMVVFQ0F3SVEyOXNiM0poWkc4d0lCY05OekF3TVRBeE1EQXdNREF3V2hnUE5EQXdNVEF4TURFd01EQXdNREJhTUZ3eEN6QUpCZ05WQkFZVEFsVlRNUll3RkFZRFZRUUtEQTFEYVhKeWRYTk5SQ0JKYm1NdU1SUXdFZ1lEVlFRTERBdEZibWRwYm1WbGNtbHVaekVNTUFvR0ExVUVBd3dEVTBSTE1SRXdEd1lEVlFRSURBaERiMnh2Y21Ga2J6Q0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQUt2NFNDT284UURvV3dnWDJHM3NHNTZXcTlBQ3VQMVlMbkQwNjVNdE5oZXZ5SGFiMWhTQTRlOStSR1R6ZUU1cDBFdUh0a3NYK3ZCek9iUFdUOVQwN0dBaVBSVkdWaVFSellpWEFOQTIvMVBBdk9Pa1JCVGUrZlJFc2FkVHJEdWx1SHhhc3B6dk9NR21KU0xIckJBUTVVTUdjck9leU9PYktnb2JzK0dUNFg4V3ZsMG1wWEN4aEZtTVozdmx3aDZJaTEwRlFqN2J0NmI2b2YremRxSXRaK1hkTWtZalB2NFc2dGp4Ym0zS005djJxaTYrcVJraWxlZW5NbTRQb2FEL09YUmZCdUZMMFJrYi9uTDgxV0M4MkFyREUzNE0ycmZrUXNMeGFvLzROdHBtVlExemtxSXNYU3g4VEZaMWpDUVJXcFIxTDAzK09BYkp3c3gwVEgwUE9Fc0NBd0VBQWFPQnVqQ0J0ekFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQjBHQTFVZERnUVdCQlI3RHdOdE5tNzVvVnZiSlBtaXg0dHY4MXlmUkRDQmhBWURWUjBqQkgwd2U0QVVldzhEYlRadSthRmIyeVQ1b3NlTGIvTmNuMFNoWUtSZU1Gd3hDekFKQmdOVkJBWVRBbFZUTVJZd0ZBWURWUVFLREExRGFYSnlkWE5OUkNCSmJtTXVNUlF3RWdZRFZRUUxEQXRGYm1kcGJtVmxjbWx1WnpFTU1Bb0dBMVVFQXd3RFUwUkxNUkV3RHdZRFZRUUlEQWhEYjJ4dmNtRmtiNElCQURBTkJna3Foa2lHOXcwQkFRc0ZBQU9DQVFFQUN6V0ZFY1N5WUQxNWQ1Qm0vdEhWZTRzQU44RWNNVGFQaVRXWkdYN0dXNGZUTFphWE5XRCtrUnN6VDlOU0FCNDVGNHF6Q3pCNE1hbmdZSHI5VlR0c1kzeGZpVDl3ZDFpMDJtNUorTjZLeFVrZ3Awdzh3YW90bVFmLzR4WnRta21Qa1Z3Rlo1NkVXTFVKcDFLLzIvQ2hOMDRlRGNHL3pvWXI1TDVaRkRDQW5iM0s5TUdoOVM0QjdBY2lKV0k1V0lmZncreGJQN3c4ckc3Y2sveDliWXFZbXZmelBrdXh0elRSK1Z1bHV5aDJCMzI2QU5na1k0dDNRNWNDNk1JQm45VFdFTEt3L1p4a2E3SUhKdGZ0ekxxZlpMckJBd1VFcm1OK29IbmFBaGxZb1VjdG9yNmk5alFmQTNnSTVTTW9hcVpUWEwrK0I4aW9nVHJZOUgwNWFEYzZ0dz09IiwicHVibGljX2tleV9wZW0iOiItLS0tLUJFR0lOIFBVQkxJQyBLRVktLS0tLVxuTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUFxL2hJSTZqeEFPaGJDQmZZYmV3YlxubnBhcjBBSzQvVmd1Y1BUcmt5MDJGNi9JZHB2V0ZJRGg3MzVFWlBONFRtblFTNGUyU3hmNjhITTVzOVpQMVBUc1xuWUNJOUZVWldKQkhOaUpjQTBEYi9VOEM4NDZSRUZONzU5RVN4cDFPc082VzRmRnF5bk84NHdhWWxJc2VzRUJEbFxuUXdaeXM1N0k0NXNxQ2h1ejRaUGhmeGErWFNhbGNMR0VXWXhuZStYQ0hvaUxYUVZDUHR1M3B2cWgvN04yb2kxblxuNWQweVJpTSsvaGJxMlBGdWJjb3oyL2FxTHI2cEdTS1Y1NmN5YmcraG9QODVkRjhHNFV2UkdSditjdnpWWUx6WVxuQ3NNVGZnemF0K1JDd3ZGcWovZzIybVpWRFhPU29peGRMSHhNVm5XTUpCRmFsSFV2VGY0NEJzbkN6SFJNZlE4NFxuU3dJREFRQUJcbi0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLVxuIn0=";

    self.sdkID = @"21dca847-a7c8-4150-99eb-a255231a2f00";

    [self loadTokenForPatient:@886];

    UIViewController *root = [CirrusMDSDKSession.singleton messageViewController];
    [self setViewControllers:@[root] animated:NO];
    [self addRightBarButtonItem];
    [self addLeftBarButtonItem];
}

- (void)configureSessionDelegate {
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    errorLabel.text = @"Custom Error View";
    errorLabel.textColor = [UIColor whiteColor];

    self.errorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.errorView addSubview:errorLabel];
    self.errorView.backgroundColor = [UIColor redColor];

    UILabel *loggedOutLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    loggedOutLabel.text = @"Custom Logged Out View";
    loggedOutLabel.textColor = [UIColor whiteColor];

    self.loggedOutView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.loggedOutView addSubview:loggedOutLabel];
    self.loggedOutView.backgroundColor = [UIColor blueColor];

    /*
        Uncomment the following line to set custom colors.
     */
    
    [self configureColors];
    
    /*
        Uncomment the following line to set a custom CirrusMDSKSessionDelegate
        This allows you provide custom error and logged out views to the SDK.
    */

//     CirrusMDSDKSession.singleton.delegate = self;
}

- (void)configureColors {
    CirrusMDSDKColorConfig* config = [[CirrusMDSDKColorConfig alloc] init];
    config.primary = @"FF5733";
    
    [CirrusMDSDKSession.singleton setColorConfig:config];
}

/*
    CirrusMDSKSessionDelegate method called by the SDK whenever an error view
    is displayed. Provide your own view to customize what is shown to the user.
*/
- (UIView *)viewForErrorWithCode:(enum CirrusMDSDKSessionResult)code {
    return self.errorView;
}

/*
    CirrusMDSKSessionDelegate method called by the SDK whenever the SDK is logged
    out via `[CirrusMDSDKSession.singleton logout]`. Provide your own view to
    customize what is shown to the user.
*/
- (UIView *)viewForLoggedOut {
    return self.loggedOutView;
}

- (void)styleNavigationBar {
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.01 green:0.4 blue:0.62 alpha:1];
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)addRightBarButtonItem {
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                  target:self
                                                                                  action:@selector(showMenu:)];
    self.navigationBar.topItem.rightBarButtonItem = searchButton;
}

- (void)addLeftBarButtonItem {
    if (self.tabBarController != nil) { return; }
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                 target:self
                                                                                 action:@selector(close:)];
    self.navigationBar.topItem.leftBarButtonItem = closeButton;
}


- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}
    
- (IBAction)showMenu:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];




    UIAlertAction *loadLucy =
    [UIAlertAction actionWithTitle:@"Load Lucy Barnet"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self loadTokenForPatient:@887];
                           }];

    UIAlertAction *loadMicah =
    [UIAlertAction actionWithTitle:@"Load Micah Green"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self loadTokenForPatient:@886];
                           }];

    UIAlertAction *resetLucyHistory =
    [UIAlertAction actionWithTitle:@"Reset Lucy Barnet's History"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self resetHistoryForPatient:@887];
                           }];

    UIAlertAction *resetMicahHistory =
    [UIAlertAction actionWithTitle:@"Reset Micah Green's History"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self resetHistoryForPatient:@886];
                           }];

    UIAlertAction *logout =
    [UIAlertAction actionWithTitle:@"Log Out"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self logout];
                           }];

    UIAlertAction *registerForRN =
    [UIAlertAction actionWithTitle:@"Register for Remote Notifications"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self registerDeviceToken];
                           }];

    UIAlertAction *unregisterForRN =
    [UIAlertAction actionWithTitle:@"Unregister for Remote Notifications"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self unregisterDeviceToken];
                           }];

    UIAlertAction *toggleCustomViewsOn  =
    [UIAlertAction actionWithTitle:@"Custom Views On"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               CirrusMDSDKSession.singleton.delegate = self;
                           }];

    UIAlertAction *toggleCustomViewsOff  =
    [UIAlertAction actionWithTitle:@"Custom Views Off"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               CirrusMDSDKSession.singleton.delegate = nil;
                           }];

    UIAlertAction *triggerError =
    [UIAlertAction actionWithTitle:@"Trigger Error"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self setToken: @"INVALID"];
                           }];

    UIAlertAction *close = [UIAlertAction actionWithTitle:@"Close"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];

    [alertController addAction:loadLucy];
    [alertController addAction:loadMicah];
    [alertController addAction:resetLucyHistory];
    [alertController addAction:resetMicahHistory];
    [alertController addAction:registerForRN];
    [alertController addAction:unregisterForRN];
    [alertController addAction:toggleCustomViewsOn];
    [alertController addAction:toggleCustomViewsOff];
    [alertController addAction:triggerError];
    [alertController addAction:logout];
    [alertController addAction:close];

    if(UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [alertController setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alertController
                                                         popoverPresentationController];
        popPresenter.barButtonItem = sender;
    }
    else {
        [alertController setModalPresentationStyle:UIModalPresentationNone];
    }

    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)loadTokenForPatient:(NSNumber *)patientID {
    [CirrusMDSDKSession.singleton setSecret: self.secret];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://staging.cirrusmd.com/sdk/v1/sandbox/sessions"];
    NSDictionary *postDict = @{@"patient_id": patientID, @"sdk_id": self.sdkID};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:nil];

    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];

    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.serverToken = responseDict[@"token"];
            [self setToken: self.serverToken];
        }
    }];

    [postDataTask resume];
}

- (void)resetHistoryForPatient:(NSNumber *)patientID {
    [CirrusMDSDKSession.singleton setSecret: self.secret];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://staging.cirrusmd.com/sdk/v1/sandbox/history"];
    NSDictionary *postDict = @{@"patient_id": patientID, @"sdk_id": self.sdkID};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:nil];

    [request setURL:url];
    [request setHTTPMethod:@"DELETE"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];

    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self setToken:self.serverToken];
    }];

    [postDataTask resume];
}

- (void)setToken:(NSString *)token {

    /*
     Loads an SSO user from the provided token.`[CirrusMDSDKSession.singleton setSecret:]`
     must be called prior to calling `[CirrusMDSDKSession.singleton setToken:completion:]`
     */
    [CirrusMDSDKSession.singleton setToken:token
                                completion:^(CirrusMDSDKSessionResult result)
     {
         switch (result) {
             case CirrusMDSDKSessionResultSuccess:
                 // The token is valid and the patient's profile loaded successfully
                 NSLog(@"CirrusMDSDKSessionResultSuccess");
                 break;

             case CirrusMDSDKSessionResultInvalidToken:
                 // The token is expired, incomplete, invalid and/or the patient was
                 // unable to load. You must retrieve a new token before proceeding.
                 NSLog(@"CirrusMDSDKSessionResultInvalidToken");
                 break;

             case CirrusMDSDKSessionResultNoSecretProvided:
                 // The secret provided is missing or invalid. You must provide
                 // a valid secret before setting a token
                 NSLog(@"CirrusMDSDKSessionResultNoSecretProvided");
                 break;

             case CirrusMDSDKSessionResultServiceUnavailable:
                 // CirrusMD servers are unreachable, try again later
                 NSLog(@"CirrusMDSDKSessionResultInvalidToken");
                 break;
         }
     }];
}

- (void)logout {
    [CirrusMDSDKSession.singleton logout];
}

- (void)registerDeviceToken {
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:
     (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil];

    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)unregisterDeviceToken {
    [CirrusMDSDKSession.singleton unregisterforRemoteNotifications];
}

@end
