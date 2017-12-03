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
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureSessionDelegate];
    [self styleNavigationBar];


    self.secret = @"eyJzaGFyZWRfc2VjcmV0IjoiZDNlNDYwYjQtOTc3YS00N2QyLTk4YmMtN2M4ZGI1YTkyYTMxIiwieDUwOV9jZXJ0X2RlciI6Ik1JSUQ4RENDQXRpZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREJjTVFzd0NRWURWUVFHRXdKVlV6RVdNQlFHQTFVRUNnd05RMmx5Y25WelRVUWdTVzVqTGpFVU1CSUdBMVVFQ3d3TFJXNW5hVzVsWlhKcGJtY3hEREFLQmdOVkJBTU1BMU5FU3pFUk1BOEdBMVVFQ0F3SVEyOXNiM0poWkc4d0lCY05OekF3TVRBeE1EQXdNREF3V2hnUE5EQXdNVEF4TURFd01EQXdNREJhTUZ3eEN6QUpCZ05WQkFZVEFsVlRNUll3RkFZRFZRUUtEQTFEYVhKeWRYTk5SQ0JKYm1NdU1SUXdFZ1lEVlFRTERBdEZibWRwYm1WbGNtbHVaekVNTUFvR0ExVUVBd3dEVTBSTE1SRXdEd1lEVlFRSURBaERiMnh2Y21Ga2J6Q0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQU5aNkdTRlVGODFLODN6blBPOFZVOHpnUUE5aGF6dFFoa1BqWloxTmlQZnBYL0ZrNUdaR2I1WVplUzU1VzZET1dDNU1ydTQrOW9BcWtRQ3haSGtDa1pTQmpTdTMxY05lNlVIMTZHbnU1S2xBekx2TDJGeDRMOFhCS2FVQVlLMUZnZ2FmcFE5d0dLOGVVMWpjR3U2VTVybXlaNkRpdlJoNlZpVDJndHFuTmhHTzBTV1hlYkQxaS8rM1AzbGhzRFhlaGZLaEJYWk1QZWlPNmR1VElabWYvWFpORzlHZHVOZkthZ1dHY0prcXBweHB6Q1U3akMyQXJ5L0ZFYnVwckorcGh6aUpTd09abVAyekw4ZXltQUNZL1Q3dTZKMXJlWHA5MFNrS3pRRnlBSytEN2thbzJyMzVkQ2Q5Nm1CZVJRdTcwRWxzT3FSalJEa1huUFpLN3N2VlVRRUNBd0VBQWFPQnVqQ0J0ekFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQjBHQTFVZERnUVdCQlN3a0ZpRDlXVkZwc3hrT2JoUVhzakRad0FpYmpDQmhBWURWUjBqQkgwd2U0QVVzSkJZZy9WbFJhYk1aRG00VUY3SXcyY0FJbTZoWUtSZU1Gd3hDekFKQmdOVkJBWVRBbFZUTVJZd0ZBWURWUVFLREExRGFYSnlkWE5OUkNCSmJtTXVNUlF3RWdZRFZRUUxEQXRGYm1kcGJtVmxjbWx1WnpFTU1Bb0dBMVVFQXd3RFUwUkxNUkV3RHdZRFZRUUlEQWhEYjJ4dmNtRmtiNElCQURBTkJna3Foa2lHOXcwQkFRc0ZBQU9DQVFFQWZmS0dHREk5SjVLSlhjVU9kQ05GemM2TDFNdC93TnJPa3l0RTJTb0JWcytaTUhwdDNJeVMwZTUvallKYlhSOFdneFVBa000WVhXazZHdXljYlhRMVE4Wk9QYnB3VXYxcy84aEV6V2haK0lpdnlXL2ErMTV5UmpaYzFTWE4rTEFwSzFKalVpSFFiZlpldGMvemo3Rm1PMG9mU2tJdjlaQmJPcXFVWmY4S0pRc3lCcGl3TDdBUUxZOUlqTzlYa1Q2WG45NkxLT3IwdHRUZU5obGJVZHd4TVFMdTRCeGpTd1FidXlUb0h5d3pxUHhNQU9OWXdldVZGbzdQUlNNV0g4TGFONGwySXdCUngzZHQ2SmFuRWprM0ZLQ3lKd2xZNDJLSTBUYzBBZy9zLzE5UTdjZXpHUWh5YXY4alR1ZWlNRlUyeEl1YWVUOXZsS2hqbUg0Tk5BanE1dz09IiwicHVibGljX2tleV9wZW0iOiItLS0tLUJFR0lOIFBVQkxJQyBLRVktLS0tLVxuTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUExbm9aSVZRWHpVcnpmT2M4N3hWVFxuek9CQUQyRnJPMUNHUStObG5VMkk5K2xmOFdUa1prWnZsaGw1TG5sYm9NNVlMa3l1N2o3MmdDcVJBTEZrZVFLUlxubElHTks3ZlZ3MTdwUWZYb2FlN2txVURNdTh2WVhIZ3Z4Y0VwcFFCZ3JVV0NCcCtsRDNBWXJ4NVRXTndhN3BUbVxudWJKbm9PSzlHSHBXSlBhQzJxYzJFWTdSSlpkNXNQV0wvN2MvZVdHd05kNkY4cUVGZGt3OTZJN3AyNU1obVovOVxuZGswYjBaMjQxOHBxQllad21TcW1uR25NSlR1TUxZQ3ZMOFVSdTZtc242bUhPSWxMQTVtWS9iTXZ4N0tZQUpqOVxuUHU3b25XdDVlbjNSS1FyTkFYSUFyNFB1UnFqYXZmbDBKMzNxWUY1RkM3dlFTV3c2cEdORU9SZWM5a3J1eTlWUlxuQVFJREFRQUJcbi0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLVxuIn0=";

    [self loadTokenForPatient:@270];

    UIViewController *root = [CirrusMDSDKSession.singleton messageViewController];
    [self setViewControllers:@[root] animated:NO];
    [self addRightBarButtonItem];
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
        Uncomment the following line to set a custom CirrusMDSKSessionDelegate
        This allows you provide custom error and logged out views to the SDK.
    */

//     CirrusMDSDKSession.singleton.delegate = self;
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

- (IBAction)showMenu:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

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


    UIAlertAction *loadPatient270 =
    [UIAlertAction actionWithTitle:@"Load Patient 270"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self loadTokenForPatient:@270];
                           }];

    UIAlertAction *loadPatient271 =
    [UIAlertAction actionWithTitle:@"Load Patient 1"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               [self loadTokenForPatient:@1];
                           }];

    UIAlertAction *close = [UIAlertAction actionWithTitle:@"Close"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:logout];
    [alertController addAction:registerForRN];
    [alertController addAction:unregisterForRN];
    [alertController addAction:loadPatient270];
    [alertController addAction:loadPatient271];
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
    NSDictionary *postDict = @{@"patient_id": patientID, @"sdk_id": @"a7236e99-4e4a-4bc9-b29f-abf5616bbeb7"};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:nil];

    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];

    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [self setToken: responseDict[@"token"]];
        }
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
    NSString* str = @"teststring";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [CirrusMDSDKSession.singleton registerforRemoteNotifications: data];
}

- (void)unregisterDeviceToken {
    [CirrusMDSDKSession.singleton unregisterforRemoteNotifications];
}

@end
