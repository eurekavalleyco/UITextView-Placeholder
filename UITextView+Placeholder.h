//
//  UITextView+Placeholder.h
//  UITextView+Placeholder
//
//  Created by Ken M. Haggerty on 12/17/15.
//  Copyright © 2015 MCMDI. All rights reserved.
//

#pragma mark - // NOTES (Public) //

#pragma mark - // IMPORTS (Public) //

#import <UIKit/UIKit.h>

#pragma mark - // PROTOCOLS //

#pragma mark - // DEFINITIONS (Public) //

@interface UITextView (Placeholder) <UITextViewDelegate>
- (void)setPlaceholder:(NSString *)placeholder;
- (void)showPlaceholder:(BOOL)show;
@end
