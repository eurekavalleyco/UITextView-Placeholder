//
//  UITextView+Placeholder.m
//  UITextView+Placeholder
//
//  Created by Ken M. Haggerty on 12/17/15.
//  Copyright © 2015 MCMDI. All rights reserved.
//

#pragma mark - // NOTES (Private) //

#pragma mark - // IMPORTS (Private) //

#import "UITextView+Placeholder.h"
#import "AKDebugger.h"
#import "AKGenerics.h"
#import <objc/runtime.h>

#pragma mark - // DEFINITIONS (Private) //

#define DEFAULT_ALPHA 0.33f

@implementation UITextView (Placeholder)

#pragma mark - // SETTERS AND GETTERS //

- (void)setPlaceholderTextView:(UITextView *)placeholderTextView
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetter tags:@[AKD_UI] message:nil];
    
    objc_setAssociatedObject(self, @selector(placeholderTextView), placeholderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITextView *)placeholderTextView
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeGetter tags:@[AKD_UI] message:nil];
    
    UITextView *placeholderTextView = objc_getAssociatedObject(self, @selector(placeholderTextView));
    if (placeholderTextView)
    {
        if (![self.subviews containsObject:placeholderTextView])
        {
            [self addSubview:placeholderTextView];
            [self sendSubviewToBack:placeholderTextView];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:placeholderTextView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:placeholderTextView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:placeholderTextView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:placeholderTextView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
        }
        return placeholderTextView;
    }
    
    placeholderTextView = [[UITextView alloc] initWithFrame:self.bounds textContainer:nil];
    [placeholderTextView setUserInteractionEnabled:NO];
    [placeholderTextView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [placeholderTextView setScrollEnabled:NO];
    [placeholderTextView setBackgroundColor:[UIColor clearColor]];
    [placeholderTextView setAlpha:DEFAULT_ALPHA];
    [placeholderTextView setTextContainerInset:self.textContainerInset];
    [placeholderTextView.textContainer setLineFragmentPadding:self.textContainer.lineFragmentPadding];
    [placeholderTextView setFont:self.font];
    [placeholderTextView setTextColor:self.textColor];
    [placeholderTextView setDelegate:self];
    [self setPlaceholderTextView:placeholderTextView];
    return self.placeholderTextView;
}

#pragma mark - // INITS AND LOADS //

#pragma mark - // PUBLIC METHODS //

- (void)setPlaceholder:(NSString *)placeholder
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetter tags:@[AKD_UI] message:nil];
    
    [self.placeholderTextView setText:placeholder];
}

- (void)showPlaceholder:(BOOL)show
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeUnspecified tags:@[AKD_UI] message:nil];
    
    CGFloat alpha = 0.0f;
    if (show) alpha = DEFAULT_ALPHA;
    [self.placeholderTextView setAlpha:alpha];
}

#pragma mark - // DELEGATED METHODS //

#pragma mark - // OVERWRITTEN METHODS //

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetup tags:@[AKD_UI] message:nil];
    
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetup tags:@[AKD_UI] message:nil];
    
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetup tags:@[AKD_UI] message:nil];
    
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetup tags:@[AKD_UI] message:nil];
    
    [super didMoveToWindow];
}

- (void)layoutIfNeeded
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetup tags:@[AKD_UI] message:nil];
    
    [super layoutIfNeeded];
    
    [self showPlaceholder:(self.text.length == 0)];
}

- (void)layoutSubviews
{
    [AKDebugger logMethod:METHOD_NAME logType:AKLogTypeMethodName methodType:AKMethodTypeSetup tags:@[AKD_UI] message:nil];
    
    [super layoutSubviews];
    
//    if (![self.subviews containsObject:self.placeholderTextView])
//    {
//        [self addSubview:self.placeholderTextView];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.placeholderTextView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.placeholderTextView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.placeholderTextView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.placeholderTextView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
//    }
}

#pragma mark - // PRIVATE METHODS //

@end
