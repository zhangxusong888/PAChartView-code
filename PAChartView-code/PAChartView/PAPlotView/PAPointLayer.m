//
//  PAPointLayer.m
//  PAChartView
//
//  Created by admin on 16/1/15.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAPointLayer.h"
#import <UIKit/UIKit.h>
#import "PATheme.h"

#define  kDiam        10.0
#define  kLineWidth   3.0

#define  kStokeColor         0xff0000
#define  kFillColor          0xffffff

@implementation PAPointLayer

- (instancetype)initWithCenter:(CGPoint)center {
    self = [super init];
    if (self) {
        CGFloat radius = kDiam / 2.0;
        CGFloat x = center.x - radius;
        CGFloat y = center.y - radius;
        self.frame = CGRectMake(x, y, kDiam, kDiam);
        self.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        self.strokeColor = [UIColorFromRGB(kStokeColor) CGColor];
        self.lineWidth = kLineWidth;
        self.fillColor = [UIColorFromRGB(kFillColor) CGColor];
    }
    return self;
}

@end
