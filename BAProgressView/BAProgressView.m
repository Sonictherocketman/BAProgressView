//
//  BAProgressView.m
//  MTGCounter
//
//  Created by Brian Schrader on 7/28/13.
//  Copyright (c) 2013 Brian Schrader. All rights reserved.
//

#import "BAProgressView.h"

@interface BAProgressView ()

- (void) configureDefaults;
- (void) updateInterface;

@property (nonatomic) NSInteger currentIndicators;

@end

@implementation BAProgressView

#pragma mark - Initilization

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self configureDefaults];
    }
    return self;
}

- (id) init {
    self = [super init];
    if (self) {
        //Configure
        [self configureDefaults];
    }
    return self;
}

#pragma mark - Configuration

-(void)configureDefaults {
    //Zero everything to default
    _progress = 0.0;
    _progressIndicatorImage = [UIImage imageNamed:@"BAProgressImage.png"];
    _trackIndicatorImage = [UIImage imageNamed:@"BATrackImage.png"];
    _totalIndicators = 10;
    _tintColor = [UIColor blueColor];//Kind of a gray-blue. What? I like it!
    _currentIndicators = 0;
    [self setBackgroundColor:[UIColor clearColor]];
}

-(void)drawRect:(CGRect)rect {
    [self updateInterface];
}

-(void)updateInterface {
    float indicatorRectWidth = self.frame.size.width / _totalIndicators;
    float indicatorRectHeight;
    float indicatorWidthPadding;
    
    //Adds padding to the indicators to space them out (1% spacing)
    indicatorWidthPadding = (0.01 * self.frame.size.width);
    indicatorRectWidth = indicatorRectWidth - indicatorWidthPadding;
    indicatorRectHeight = indicatorRectWidth;
    
    CGRect indicatorRect = CGRectMake(0, 0, indicatorRectWidth, indicatorRectHeight);
    
    //Set the tint color and draw the indicators
    for (int i = 1; i <= _totalIndicators; i++) {
        if (i <= _currentIndicators) {
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);
            CGContextDrawImage(context, indicatorRect, _progressIndicatorImage.CGImage);
            CGContextSetBlendMode (context, kCGBlendModeSourceIn);
            CGContextSetFillColor(context, CGColorGetComponents(_tintColor.CGColor));
            CGContextFillRect (context, indicatorRect);
            CGContextRestoreGState(context);
        } else {
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextScaleCTM(context, 1, -1);
            CGContextTranslateCTM(context, 0, -indicatorRect.size.height);
            CGContextSaveGState(context);
            CGContextDrawImage(context, indicatorRect, _trackIndicatorImage.CGImage);
            CGContextSetBlendMode (context, kCGBlendModeSourceIn);
            CGContextSetFillColor(context, CGColorGetComponents(_tintColor.CGColor));
            CGContextFillRect (context, indicatorRect);
            CGContextRestoreGState(context);
        }
        indicatorRect.origin.x = (indicatorRectWidth * i) + (indicatorWidthPadding * i);
    }
}

#pragma mark - Public Methods

-(void) setProgress:(float)progress {    
    _progress = progress * _totalIndicators;
    _currentIndicators = (int)roundf(_progress);
    if (_currentIndicators <= _totalIndicators) {
        [self setNeedsDisplay];
    } else {
        _currentIndicators = _totalIndicators;
        _progress = 1.0;
    }
}

@end
