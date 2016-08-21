//
//  SATProgressBar.h
//  DevAnimation
//
//  Created by Artem on 20.08.16.
//  Copyright © 2016 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SATProgressBar : UIView

@property(nonatomic, strong) UIView *progressView;

@property(nonatomic, strong) UIColor *progressColor;
@property(nonatomic, assign) CGFloat minimumValue;
@property(nonatomic, assign) CGFloat maximumValue;
@property(nonatomic, assign) CGFloat value;

@end
