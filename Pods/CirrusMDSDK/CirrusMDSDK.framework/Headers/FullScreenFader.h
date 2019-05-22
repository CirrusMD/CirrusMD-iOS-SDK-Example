//
//  CirrusMD
//
//  Created by David Nix on 8/21/15.
//  Copyright (c) 2015 CirrusMD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

@interface FullScreenFader : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic, readwrite) BOOL isPresenting;

@end
