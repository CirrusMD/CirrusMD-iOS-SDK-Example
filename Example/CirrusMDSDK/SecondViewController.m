//
//  SecondViewController.m
//  CirrusMDSDK
//
//  Created by CirrusMD.
//  Copyright (c) 2017 CirrusMD. All rights reserved.
//

#import "SecondViewController.h"
#import "ExampleViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSDK:(id)sender {
    UIViewController* example = [[ExampleViewController alloc] init];
    [self presentViewController:example animated:YES completion:^{}];
}

@end
