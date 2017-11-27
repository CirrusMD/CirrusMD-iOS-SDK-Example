//
//  FirstViewController.m
//  CirrusMDSDK-Example
//
//  Created by Sean Dougherty on 10/13/17.
//  Copyright © 2017 CirrusMD. All rights reserved.
//

#import "FirstViewController.h"
#import "CirrusMDSDK/CirrusMDSDK-Swift.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.barTintColor = [UIColor colorWithRed:0.01 green:0.4 blue:0.62 alpha:1];
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    self.navigationBar.tintColor = [UIColor whiteColor];
    UIViewController *root = [CirrusMDSDKSession.singleton messageViewController];
    [self setViewControllers:@[root] animated:NO];
}

@end
