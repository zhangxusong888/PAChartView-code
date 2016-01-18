//
//  PAPathLayer.m
//  PAChartView
//
//  Created by admin on 16/1/14.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAPathLayer.h"
#import "PATheme.h"
#import <UIKit/UIKit.h>

#define kStartColor             0x88ff88
#define kEndLineColor           0xff8888

@implementation PAPathLayer

- (instancetype)initWithFrame:(CGRect)frame
                   xAxisArray:(NSArray *)xValues
                   yAxisArray:(NSArray *)yValues {
    self = [super init];
    if (self) {
        self.frame = frame;
        self.colors = @[(__bridge id)[UIColorFromRGB(kStartColor) CGColor],
                        (__bridge id)[UIColorFromRGB(kEndLineColor) CGColor]];
        // X 轴颜色渐变，Y 轴颜色不变
        self.startPoint = CGPointMake(0, 1);
        self.endPoint = CGPointMake(0, 0);
        
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        lineLayer.path = [self drawLineWithXAxisArray:xValues yAxisArray:yValues];
        lineLayer.lineWidth = 4.0;
        lineLayer.strokeColor = [[UIColor blackColor] CGColor];
        self.mask = lineLayer;
    }
    return self;
}

// MARK: Private Functions
- (CGPathRef)drawLineWithXAxisArray:(NSArray *)xAxisArray yAxisArray:(NSArray *)yAxisArray {
    // CAGradientLayer 是对一个区域做颜色渐变。所以折线从起点到终点又回到原点，表示闭合的区域，解决折线交接处有缺口的问题
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 往前画折线
    for (NSInteger i = 0; i < xAxisArray.count; i++) {
        CGPoint point = CGPointMake([xAxisArray[i] floatValue], [yAxisArray[i] floatValue]);
        if (0 == i) {
            [path moveToPoint:point];
        } else {
            [path addLineToPoint:point];
        }
    }
    // 按原路返回
    for (NSInteger i = (xAxisArray.count - 2); i > 0; i--) {
        CGPoint point = CGPointMake([xAxisArray[i] floatValue], [yAxisArray[i] floatValue]);
        [path addLineToPoint:point];
    }
    // 形成封闭区域
    [path closePath];
    
    return path.CGPath;
}

@end
