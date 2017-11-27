//
//  UIView+CirrusAdditions.h
//  CirrusMD
//
//  Created by Justin Gitlin on 11/8/12.
//  Copyright (c) 2012 CirrusMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CirrusAdditions)

- (void)styleBorder;
- (UIView *)subViewPassingTest:(BOOL(^)(UIView *subView))testBlock;
- (BOOL)recursivelyResignFirstResponder;
- (void)addDefaultTransitionAnimation;

+ (UIView *)viewFromNib:(NSString *)nibName;

@end
