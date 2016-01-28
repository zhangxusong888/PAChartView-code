//
//  PAPlotView.m
//  PAChartView
//
//  Created by admin on 16/1/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAPlotView.h"
#import "PAGridLayer.h"
#import "PAPathLayer.h"
#import "PAMarkLayer.h"

#define kDefultRow            6
#define kDefultColumn         6

@interface PAPlotView ()
// 数据以及数据的上下限
@property (assign, nonatomic) CGFloat min;
@property (assign, nonatomic) CGFloat max;
@property (strong, nonatomic) NSArray *datas;
// 图表类型
@property (assign, nonatomic) PAPlotType type;
// 显示或者隐藏底部的格子背景
@property (assign, nonatomic) BOOL loadGridLayer;
// 图表的层
@property (strong, nonatomic) PAGridLayer *gridLayer;
@property (strong, nonatomic) PAPathLayer *pathLayer;
@property (strong, nonatomic) PAMarkLayer *markLayer;
// X 坐标是否居中，目前固定为不居中，从左侧开始
@property (assign, nonatomic) BOOL isXAxisCenter;

@end

@implementation PAPlotView

// MARK: Public Interface Functions
- (instancetype)initWithFrame:(CGRect)frame
                          min:(CGFloat)min
                          max:(CGFloat)max
                        datas:(NSArray *)datas
                         type:(PAPlotType)type {
    self = [super init];
    if (self) {
        self.frame = frame;
        self.min = min;
        self.max = max;
        self.datas = [NSArray arrayWithArray:datas];
        self.type = type;
        switch (self.type) {
            case PAPlotTypePointsAndLabels:
            case PAPlotTypeTheLastOneWithGrid:
                self.loadGridLayer = YES;
                break;
                
            default:
                self.loadGridLayer = NO;
                break;
        }
        [self loadAllLayers];
        // X 坐标是否居中，目前固定为不居中，从左侧开始
        self.isXAxisCenter = false;
    }
    return self;
}

- (void)updatePlotWithDatas:(NSArray *)datas {
    [self updatePlotWithDatas:datas min:self.min max:self.max];
}

- (void)updatePlotWithDatas:(NSArray *)datas
                        min:(CGFloat)min
                        max:(CGFloat)max {
    if (nil == datas) {
        return;
    }
    if (min >= max) {
        return;
    }
    if (min != self.min) {
        self.min = min;
    }
    if (max != self.max) {
        self.max = max;
    }
    self.datas = [NSArray arrayWithArray:datas];
    [self reloadAllLayers];
}

// MARK: Private Fucntions
- (void)reloadAllLayers {
    [self removeAllLayers];
    [self loadAllLayers];
}

- (void)loadAllLayers {
    [self loadPAGridLayer];
    [self loadPAPathLayer];
    [self loadPAMarkLayer];
}

- (void)removeAllLayers {
    [self removePAGridLayer];
    [self removePAPathLayer];
    [self removePAMarkLayer];
}

// grid layer
- (void)loadPAGridLayer {
    if (!self.loadGridLayer) {
        return;
    }
    if (nil == self.gridLayer) {
        // 这里要取frame，所以先更新一下autolayout，防止数据是旧的
        [self layoutIfNeeded];
        NSInteger column = self.datas.count;
        if (column <= 0) {
            column = kDefultColumn;
        }
        self.gridLayer = [[PAGridLayer alloc] initWithFrame:self.bounds row:kDefultRow column:column];
        [self.layer addSublayer:self.gridLayer];
    }    
}

- (void)removePAGridLayer {
    if (nil != self.gridLayer) {
        [self.gridLayer removeFromSuperlayer];
        self.gridLayer = nil;
    }
}

// path layer
- (void)loadPAPathLayer {
    if (nil == self.pathLayer) {
        // 这里要取frame，所以先更新一下autolayout，防止数据是旧的
        [self layoutIfNeeded];
        NSArray *xValues = [self generateXAxisArray];
        NSArray *yValues = [self generateYAxisArray];
        self.pathLayer = [[PAPathLayer alloc] initWithFrame:self.bounds xAxisArray:xValues yAxisArray:yValues];
        [self.layer addSublayer:self.pathLayer];
    }
}

- (void)removePAPathLayer {
    if (nil != self.pathLayer) {
        [self.pathLayer removeFromSuperlayer];
        self.pathLayer = nil;
    }
}

// mark layer
- (void)loadPAMarkLayer {
    if (nil == self.markLayer) {
        // 这里要取frame，所以先更新一下autolayout，防止数据是旧的
        [self layoutIfNeeded];
        NSArray *xValues = [self generateXAxisArray];
        NSArray *yValues = [self generateYAxisArray];
        self.markLayer = [[PAMarkLayer alloc] initWithFrame:self.bounds xAxisArray:xValues yAxisArray:yValues actrualDatas:self.datas chartType:self.type];
        [self.layer addSublayer:self.markLayer];
    }
}

- (void)removePAMarkLayer {
    if (nil != self.markLayer) {
        [self.markLayer removeFromSuperlayer];
        self.markLayer = nil;
    }
}

// 转换数据为layer的坐标
- (NSArray *)generateXAxisArray {
    NSMutableArray *xAxisArray = [NSMutableArray array];
    CGFloat step = self.frame.size.width / self.datas.count;
    CGFloat halfStep = step / 2;
    if (!self.isXAxisCenter) {
        halfStep = 0;
    }
    
    for (NSInteger i = 0; i < self.datas.count; i++) {
        CGFloat value = halfStep + (step * i);
        xAxisArray[i] = [NSNumber numberWithFloat:value];
    }
    
    return [NSArray arrayWithArray:xAxisArray];
}

- (NSArray *)generateYAxisArray {
    NSMutableArray *yAxisArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.datas.count; i++) {
        CGFloat value = ((self.max - [self.datas[i] floatValue]) / (self.max - self.min)) * self.frame.size.height ;
        yAxisArray[i] = [NSNumber numberWithFloat:value];
    }
    
    return [NSArray arrayWithArray:yAxisArray];
}

@end
