//
//  UITableView+CirrusAdditions.h
//  CirrusMD
//
//  Created by David Nix on 7/27/15.
//  Copyright (c) 2015 CirrusMD. All rights reserved.
//

@import UIKit;

@interface UITableView (CirrusAdditions)

- (NSIndexPath *_Nullable)indexPathForSender:(id _Nullable )sender;

- (void)safeAnimateReloadData:(void (^_Nonnull)(UITableView *_Nonnull))animations;

@end
