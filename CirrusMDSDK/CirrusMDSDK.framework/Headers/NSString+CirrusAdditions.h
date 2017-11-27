//
//  NSString+CirrusAdditions.h
//  CirrusMD
//
//  Created by Sean on 4/19/13.
//  Copyright (c) 2013 CirrusMD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (CirrusAdditions)

- (NSString *)trimWhiteSpace;
- (NSString *)trimWhiteSpaceAndNewlines;
- (BOOL)matchesRegularExpression:(NSString *)pattern;

@end
