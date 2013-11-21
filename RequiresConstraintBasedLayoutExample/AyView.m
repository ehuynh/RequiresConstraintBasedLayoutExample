//
//  AyView.m
//  RequiresConstraintBasedLayoutExample
//
//  Created by Edward Huynh on 16/11/2013.
//  Copyright (c) 2013 Edward Huynh. All rights reserved.
//

#import "AyView.h"

@interface AyView ()

@property (nonatomic, weak) UIView *redView;

@end

@implementation AyView

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    self.backgroundColor = [UIColor blueColor];
    [self addRedView];
}

- (void)addRedView
{
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    self.redView = redView;
}

#pragma mark - UIView

- (void)updateConstraints
{
    [super updateConstraints];
    
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = @{@"redView" : self.redView};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redView]-|" options:kNilOptions metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]-|" options:kNilOptions metrics:nil views:views]];
}

/**
 * Uncomment this method to see the "Red" subview lay out correctly
 */
//+ (BOOL)requiresConstraintBasedLayout
//{
//    return YES;
//}

@end
