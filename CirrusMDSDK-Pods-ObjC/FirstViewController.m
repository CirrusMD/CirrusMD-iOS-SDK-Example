//
//  FirstViewController.m
//  CirrusMDSDK-Pods-ObjC
//
//  Created by Taylor Case on 1/22/20.
//  Copyright © 2020 steam. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <CirrusMDDelegate>

@property NSNumber *patientID;
@property NSString *sdkID;
@property NSString *secret;
@property NSString *serverToken;


@property (weak, nonatomic) IBOutlet UIButton *showSdkButton;

@end

@implementation FirstViewController

- (IBAction)showSdk:(id)sender {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:CirrusMD.singleton.viewController];
    [navigationController.navigationBar setTranslucent:NO];
    [navigationController.navigationBar setBarTintColor:UIColor.blackColor];
    [navigationController.navigationBar setTintColor:UIColor.whiteColor];
    [navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    CirrusMD.singleton.config.rightBarButtonItems = @[doneButton];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)done {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CirrusMD.singleton.delegate = self;
    
    self.patientID = @63;
    self.sdkID = @"d2f0aa92-3da9-450c-9ba2-854e36a2e277";
    self.secret = @"eyJzaGFyZWRfc2VjcmV0IjoiOTg0MDMyNDYtMGJmMS00ZjNjLWFhMTktMDg1ZWFiMGMxMWE2IiwieDUwOV9jZXJ0X2RlciI6Ik1JSUQ4RENDQXRpZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREJjTVFzd0NRWURWUVFHRXdKVlV6RVdNQlFHQTFVRUNnd05RMmx5Y25WelRVUWdTVzVqTGpFVU1CSUdBMVVFQ3d3TFJXNW5hVzVsWlhKcGJtY3hEREFLQmdOVkJBTU1BMU5FU3pFUk1BOEdBMVVFQ0F3SVEyOXNiM0poWkc4d0lCY05OekF3TVRBeE1EQXdNREF3V2hnUE5EQXdNVEF4TURFd01EQXdNREJhTUZ3eEN6QUpCZ05WQkFZVEFsVlRNUll3RkFZRFZRUUtEQTFEYVhKeWRYTk5SQ0JKYm1NdU1SUXdFZ1lEVlFRTERBdEZibWRwYm1WbGNtbHVaekVNTUFvR0ExVUVBd3dEVTBSTE1SRXdEd1lEVlFRSURBaERiMnh2Y21Ga2J6Q0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQU9QVWphcHBBRTg0NnZLZE9jN1VJR0xyK3RPMzBRMy9qVTdIU0FZbFNoZCtCV290bGw4RkkvVkZoc0RXcTBFRk9VUGRvMFQvSmVOcnRuYmVYYXllUlYzSFlRNU9admxkUlZhcUNPYmRmRmFhZWpDM2JVVW5zRFdWalJqTlExZTNicVFkYk9ELzZNZTd3cTI0NFExVTdkY2ZWL3lIVlgzMEtBOUxZZSthcmhWbld4TWFrWW1LbWZ1S1Vrby8vQm5tRDZiQkpJR3hGRzJTOXEwR3ZVODJ4RHViQitDbkpzczJ3QlFpWGE3VW8rM0E3NU5VNlgrcXUySlRQYnBMSkgyZ01oYUZ3MGwzOTN6T0ZuWldGWUx3dlhrTmd0bkYzVFIySk52ZWpseFBYQ0NKN0hrZVpuZVJUdXF2RFN0cGpWK2t2WDg2cUZIZWdMSE5ZTU5rK1pONm1CTUNBd0VBQWFPQnVqQ0J0ekFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQjBHQTFVZERnUVdCQlJpTVBnbTF6SCtLamZpMlpGc3dqaEV3akZncHpDQmhBWURWUjBqQkgwd2U0QVVZakQ0SnRjeC9pbzM0dG1SYk1JNFJNSXhZS2VoWUtSZU1Gd3hDekFKQmdOVkJBWVRBbFZUTVJZd0ZBWURWUVFLREExRGFYSnlkWE5OUkNCSmJtTXVNUlF3RWdZRFZRUUxEQXRGYm1kcGJtVmxjbWx1WnpFTU1Bb0dBMVVFQXd3RFUwUkxNUkV3RHdZRFZRUUlEQWhEYjJ4dmNtRmtiNElCQURBTkJna3Foa2lHOXcwQkFRc0ZBQU9DQVFFQXBYc2owNFBpNmlveXBIMys3cHhIYVM2cmVCVGJva1REUDVlcHM2QTVJamYzSWdsVG93U3IreldYNHJTTldRVVFXZUZqK1Nwa0hmZjVrVjV1bk5GdDk3OE16aXo0SFF0QTdxVzFhVG9mNks5dy93cHh5aGkrS250VzFOYzBjNHA1d1VnWGwvM0Z6YmJIRzJzekpRZEdPaUhTR3YwS3JtU1BJMjhkQ29HOWJUZXIzcG5BTnQ3aHZ6cHJWa3NmbXlkcTB4c1dEek8rSENQSjlIa0tPYXlLUnZZRVMxQXo1TGU2dWtmazRhbWlCc2FEekVmRWE1NzlnMEZXNVRMMFhWZ2xobVluQmxpVTU4d3JjT1hPTXJVQUFFZWVDNzJRQXBIcVBHUkJWNWJnSWV5eWVuUU1PQVJvckgzV2gwY0ZaNjc2WXpOUHUwTlpoTnd5bTJZUWZrNWF3Zz09IiwicHVibGljX2tleV9wZW0iOiItLS0tLUJFR0lOIFBVQkxJQyBLRVktLS0tLVxuTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUE0OVNOcW1rQVR6anE4cDA1enRRZ1xuWXV2NjA3ZlJEZitOVHNkSUJpVktGMzRGYWkyV1h3VWo5VVdHd05hclFRVTVROTJqUlA4bDQydTJkdDVkcko1RlxuWGNkaERrNW0rVjFGVnFvSTV0MThWcHA2TUxkdFJTZXdOWldOR00xRFY3ZHVwQjFzNFAvb3g3dkNyYmpoRFZUdFxuMXg5WC9JZFZmZlFvRDB0aDc1cXVGV2RiRXhxUmlZcVorNHBTU2ovOEdlWVBwc0VrZ2JFVWJaTDJyUWE5VHpiRVxuTzVzSDRLY215emJBRkNKZHJ0U2o3Y0R2azFUcGY2cTdZbE05dWtza2ZhQXlGb1hEU1hmM2ZNNFdkbFlWZ3ZDOVxuZVEyQzJjWGROSFlrMjk2T1hFOWNJSW5zZVI1bWQ1Rk82cThOSzJtTlg2UzlmenFvVWQ2QXNjMWd3MlQ1azNxWVxuRXdJREFRQUJcbi0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLVxuIn0=";

    [self.showSdkButton setTitle:@"Initializing CirrusMDSDK..." forState:UIControlStateNormal];
    [self.showSdkButton setEnabled:NO];
    
    [self loadTokenForPatient:self.patientID];
}

- (void)loadTokenForPatient:(NSNumber *)patientID {
    [CirrusMD.singleton setSecret: self.secret];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://cmd-demo1-app.cirrusmd.com/sdk/v2/sandbox/sessions"];
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

- (void)setToken:(NSString *)token {
    /*
     Loads an SSO user from the provided token.`[CirrusMDSDKSession.singleton setSecret:]`
     must be called prior to calling `[CirrusMDSDKSession.singleton setToken:completion:]`
     */
    [CirrusMD.singleton setToken:token
                         completion:^(CirrusMDResult result)
     {
        switch (result) {
            case CirrusMDResultSuccess:
                // The token is valid and the patient's profile loaded successfully
                NSLog(@"CirrusMDSDKSessionResultSuccess");
                [self.showSdkButton setEnabled:YES];
                [self.showSdkButton setTitle:@"Show CirrusMDSDK!" forState:UIControlStateNormal];
                break;
                
            case CirrusMDResultInvalidToken:
                // The token is expired, incomplete, invalid and/or the patient was
                // unable to load. You must retrieve a new token before proceeding.
                NSLog(@"CirrusMDSDKSessionResultInvalidToken");
                [self.showSdkButton setEnabled:YES];
                [self.showSdkButton setTitle:@"Error: Invalid Token" forState:UIControlStateNormal];
                break;
                
            case CirrusMDResultNoSecretProvided:
                // The secret provided is missing or invalid. You must provide
                // a valid secret before setting a token
                NSLog(@"CirrusMDSDKSessionResultNoSecretProvided");
                [self.showSdkButton setEnabled:YES];
                [self.showSdkButton setTitle:@"Error: No Sectret Provided" forState:UIControlStateNormal];
                break;
                
            case CirrusMDResultServiceUnavailable:
                // CirrusMD servers are unreachable, try again later
                NSLog(@"CirrusMDSDKSessionResultInvalidToken");
                [self.showSdkButton setEnabled:YES];
                [self.showSdkButton setTitle:@"Error: Service Unavailable" forState:UIControlStateNormal];
                break;
        }
    }];
}

#pragma mark - CirrusMDSDKDelegate

- (void)userLoggedInCredentialId:(NSInteger)credentialId {
    NSLog(@"User Logged In");
}

- (void)userLoggedOut {
    NSLog(@"User Logged Out");
}

@end
