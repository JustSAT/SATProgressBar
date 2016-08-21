//
//  SATProgressBar.m
//  DevAnimation
//
//  Created by Artem on 20.08.16.
//  Copyright © 2016 Artem. All rights reserved.
//

#import "SATProgressBar.h"

@implementation SATProgressBar {
    NSLayoutConstraint *width;
}
@synthesize progressView;

- (id)init {
    self = [super init];
    if (self) {
        [self initializeDefaultValues];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    NSLog(@"InitWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeDefaultValues];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    if (self) {
        [self initializeDefaultValues];
    }

    return self;
}

- (void)initializeDefaultValues {

    //Init default public values
    self.progressColor = [UIColor blackColor];
    self.backgroundColor = [UIColor lightGrayColor];
    self.minimumValue = 0;
    self.maximumValue = 1;
    self.value = 0.0;

    self.borderRadius = 0;
    self.progressBorderRadius = 0;

    self.animationSpringDamping = 1.0;
    self.animationSpringVelocity = 0.1;
    self.animationType = UIViewAnimationCurveEaseInOut;

    self.animated = NO;

    self.layer.masksToBounds = YES;
    self.progressView.layer.masksToBounds = YES;

    //Init progress view
    progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 0)];
    progressView.backgroundColor = self.progressColor;
    [self addSubview:progressView];

    UIView *subView = progressView;
    UIView *parent = self;

    subView.translatesAutoresizingMaskIntoConstraints = NO;

//Width
    width = [NSLayoutConstraint
            constraintWithItem:subView
                     attribute:NSLayoutAttributeWidth
                     relatedBy:NSLayoutRelationEqual
                        toItem:parent
                     attribute:NSLayoutAttributeWidth
                    multiplier:0.0
                      constant:[self currentWidthMultiplier]];

//Leading

    NSLayoutConstraint *leading = [NSLayoutConstraint
            constraintWithItem:subView
                     attribute:NSLayoutAttributeLeading
                     relatedBy:NSLayoutRelationEqual
                        toItem:parent
                     attribute:NSLayoutAttributeLeading
                    multiplier:1.0f
                      constant:0.f];

//Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint
            constraintWithItem:subView
                     attribute:NSLayoutAttributeBottom
                     relatedBy:NSLayoutRelationEqual
                        toItem:parent
                     attribute:NSLayoutAttributeBottom
                    multiplier:1.0f
                      constant:0.f];

//Height to be fixed for SubView same as AdHeight
    NSLayoutConstraint *height = [NSLayoutConstraint
            constraintWithItem:subView
                     attribute:NSLayoutAttributeHeight
                     relatedBy:NSLayoutRelationEqual
                        toItem:nil
                     attribute:NSLayoutAttributeNotAnAttribute
                    multiplier:1.0
                      constant:self.frame.size.height];


    [parent addConstraint:width];
    [parent addConstraint:bottom];
    [parent addConstraint:leading];
    [subView addConstraint:height];
}

- (void)drawRect:(CGRect)rect {


}

- (CGFloat)currentWidthMultiplier {
    if (self.maximumValue == 0) {
        self.maximumValue = 1;
    }
    CGFloat multiplier = (self.value - self.minimumValue) / (self.maximumValue - self.minimumValue);
    return self.frame.size.width * multiplier;
}

@synthesize value;

- (void)setValue:(CGFloat)newValue {
    CGFloat resultVal = newValue;
    if (newValue > self.maximumValue) {
        resultVal = self.maximumValue;
    } else if (newValue < self.minimumValue) {
        resultVal = self.minimumValue;
    }
    value = resultVal;
    width.constant = [self currentWidthMultiplier];
    if (self.animated) {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:self.animationSpringDamping initialSpringVelocity:self.animationSpringVelocity options:self.animationType animations:^{
            [self layoutIfNeeded];
        }                completion:nil];
    } else {
        [self layoutIfNeeded];
    }
}

@synthesize progressColor;

- (void)setProgressColor:(UIColor *)newProgressColor {
    progressColor = newProgressColor;
    self.progressView.backgroundColor = progressColor;
}

@synthesize borderRadius;

- (void)setBorderRadius:(CGFloat)newBorderRadius {
    borderRadius = newBorderRadius;
    self.layer.cornerRadius = newBorderRadius;
}

@synthesize progressBorderRadius;

- (void)setProgressBorderRadius:(CGFloat)newProgressBorderRadius {
    progressBorderRadius = newProgressBorderRadius;
    self.progressView.layer.cornerRadius = newProgressBorderRadius;
}

@end
