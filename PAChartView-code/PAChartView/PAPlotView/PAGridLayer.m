//
//  PAGridLayer.m
//  PAChartView
//
//  Created by admin on 16/1/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAGridLayer.h"
#import "PATheme.h"
#import <UIKit/UIKit.h>

#define kBarColor             [UIColorFromRGB(0xfffcfc) CGColor]
#define kTableLineColor       [UIColorFromRGB(0xeeeeee) CGColor]
#define kLineWidth            0.5

@implementation PAGridLayer

// MARK: Public Functions
- (instancetype)initWithFrame:(CGRect)frame
                          row:(NSInteger)row
                       column:(NSInteger)column {
    self = [super init];
    if (self) {
        self.frame = frame;
        [self drawBarLayerWithColumn:column];
        [self drawTableLayerWithRow:row column:column];
    }
    return self;
}

// MARK: Private Funtions
- (void)drawBarLayerWithColumn:(NSInteger)column {
    CAShapeLayer *barLayer = [CAShapeLayer layer];
    UIBezierPath *barPath = [UIBezierPath bezierPath];
    
    CGFloat step = self.frame.size.width / column;
    CGFloat halfStep = step / 2;
    
    for (NSInteger i = 0; i < column; i++) {
        if (0 == (i % 2)) {
            continue;
        }
        CGFloat x = (step * i) + halfStep;
        CGFloat y = self.frame.size.height;
        
        [barPath moveToPoint:CGPointMake(x, 0)];
        [barPath addLineToPoint:CGPointMake(x, y)];
    }
    
    barLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);;
    barLayer.path = barPath.CGPath;
    barLayer.strokeColor = kBarColor;
    barLayer.lineWidth = step;
    [self addSublayer:barLayer];
}

- (void)drawTableLayerWithRow:(NSInteger)row column:(NSInteger)column {
    CAShapeLayer *tableLayer = [CAShapeLayer layer];
    UIBezierPath *tablePath = [UIBezierPath bezierPath];
    
    // 画 X 轴方向的竖线
    CGFloat xStep = self.frame.size.width / column;
    for (NSInteger i = 0; i <= column; i++) {
        CGFloat x = xStep * i;
        CGFloat y = self.frame.size.height;
        
        [tablePath moveToPoint:CGPointMake(x, 0)];
        [tablePath addLineToPoint:CGPointMake(x, y)];
    }
    
    // 画 Y 轴方向的横线
    CGFloat yStep = self.frame.size.height / row;
    for (NSInteger i = 0; i <= row; i++) {
        CGFloat x = self.frame.size.width;
        CGFloat y = yStep * i;
        
        [tablePath moveToPoint:CGPointMake(0, y)];
        [tablePath addLineToPoint:CGPointMake(x, y)];
    }
    
    tableLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);;
    tableLayer.path = tablePath.CGPath;
    tableLayer.strokeColor = kTableLineColor;
    tableLayer.lineWidth = kLineWidth;
    [self addSublayer:tableLayer];
}

@end
