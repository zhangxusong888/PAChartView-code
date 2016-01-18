//
//  PAMarkLayer.m
//  PAChartView
//
//  Created by admin on 16/1/15.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAMarkLayer.h"
#import "PAPointLayer.h"
#import "PALabelLayer.h"

@interface PAMarkLayer ()

@property (strong, nonatomic) NSArray *xValues;
@property (strong, nonatomic) NSArray *yValues;
@property (strong, nonatomic) NSArray *datas;

@end

@implementation PAMarkLayer

- (instancetype)initWithFrame:(CGRect)frame
                   xAxisArray:(NSArray *)xValues
                   yAxisArray:(NSArray *)yValues
                 actrualDatas:(NSArray *)datas
                    chartType:(PAPlotType)type {
    self = [super init];
    if (self) {
        self.frame = frame;
        self.xValues = [NSArray arrayWithArray:xValues];
        self.yValues = [NSArray arrayWithArray:yValues];
        self.datas = [NSArray arrayWithArray:datas];
        // 根据图表类型添加圆点和标注
        switch (type) {
            case PAPlotTypePointsAndLabels:
                [self addAllPointLayers];
                [self addAllLabelLayers];
                break;
            case PAPlotTypePointsAll:
                [self addAllPointLayers];
                break;
            case PAPlotTypePointsMiddle:
                [self addMiddlePointLayers];
                break;
            case PAPlotTypeTheLastOneOnly:
            case PAPlotTypeTheLastOneWithGrid:
                [self addLastPointLayers];
                break;
                
            default:
                break;
        }
    }
    return self;
}

// MARK: Private Functions
- (void)addAllPointLayers {
    for (NSInteger i = 0; i < self.xValues.count; i++) {
        CGPoint center = CGPointMake([self.xValues[i] floatValue], [self.yValues[i] floatValue]);
        [self addPointLayerWithPoint:center];
    }
}

- (void)addMiddlePointLayers {
    for (NSInteger i = 1; i < (self.xValues.count - 1); i++) {
        CGPoint center = CGPointMake([self.xValues[i] floatValue], [self.yValues[i] floatValue]);
        [self addPointLayerWithPoint:center];
    }
}

- (void)addAllLabelLayers {
    for (NSInteger i = 0; i < self.xValues.count; i++) {
        CGPoint point = CGPointMake([self.xValues[i] floatValue], [self.yValues[i] floatValue]);
        CGFloat data = [self.datas[i] floatValue];
        [self addLabelLayerWithPoint:point data:data];
    }
}

- (void)addLastPointLayers {
    CGFloat data = [[self.datas lastObject] floatValue];
    CGFloat x = [[self.xValues lastObject] floatValue];
    CGFloat y = [[self.yValues lastObject] floatValue];
    
    [self addPointLayerWithPoint:CGPointMake(x, y)];
    [self addLabelLayerWithPoint:CGPointMake(x, y) data:data];
}

- (void)addPointLayerWithPoint:(CGPoint)point {
    PAPointLayer *pointLayer = [[PAPointLayer alloc] initWithCenter:point];
    [self addSublayer:pointLayer];
}

- (void)addLabelLayerWithPoint:(CGPoint)point data:(CGFloat)data {
    PALabelLayer *labelLayer = [[PALabelLayer alloc] initWithData:data location:point];
    [self addSublayer:labelLayer];
}

@end
