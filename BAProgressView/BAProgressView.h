//
//  BAProgressView.h
//  MTGCounter
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
@property (nonatomic, strong) UIImage *trackIndicatorImage;
@property (nonatomic, strong) UIImage *progressIndicatorImage;

@end
