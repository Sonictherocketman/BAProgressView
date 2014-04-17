//
//  BAProgressView.h
//
//  Created by Brian Schrader on 7/28/13.
//  Copyright (c) 2013 Brian Schrader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "math.h"

@interface BAProgressView : UIView

- (void)setProgress:(float)progress;

@property (nonatomic, readonly) float progress;
@property (nonatomic) NSInteger totalIndicators;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) NSString *trackIndicator;
@property (nonatomic, strong) NSString *progressIndicator;

/* Deprecated */
@property (nonatomic, strong) UIImage *trackIndicatorImage __attribute__((deprecated("Use trackIndicator")));
@property (nonatomic, strong) UIImage *progressIndicatorImage __attribute__((deprecated("Use progressIndicator")));

@end
