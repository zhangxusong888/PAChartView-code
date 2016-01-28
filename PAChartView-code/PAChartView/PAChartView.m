//
//  PAChartView.m
//  PAChartView-code
//
//  Created by admin on 16/1/18.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PAChartView.h"
#import "PAPlotView.h"
#import "PATheme.h"

#define kMarginTop      15
#define kMarginBottom   15
#define kMarginLeft     40
#define kMarginRight    20

#define kYAxisRowCount  6

#define kYAxisOffsetX   6           // 与plot view 左边界的偏移
#define kYAxisWidth     30
#define kYAxisHeight    8
#define kYAxisFontSize  kYAxisHeight
#define kYAxisColor     0x9b9b9b

#define kXAxisOffsetY   4           // 与plot view 下边界的偏移
#define kXAxisWidth     40
#define kXAxisHeight    8
#define kXAxisFontSize  kXAxisHeight
#define kXAxisColor     0x9b9b9b

@interface PAChartView ()

@property (assign, nonatomic) CGRect plotFrame;
@property (assign, nonatomic) CGFloat plotMin;
@property (assign, nonatomic) CGFloat plotMax;
@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) NSArray *titles;
@property (assign, nonatomic) BOOL isXAxisCenter;

@end

@implementation PAChartView

// MARK: Public Functions
- (instancetype)initWithFrame:(CGRect)frame
                      plotMin:(CGFloat)plotMin
                      plotMax:(CGFloat)plotMax
                        datas:(NSArray *)datas
                       titles:(NSArray *)titles {
    self = [super init];
    if (self) {
        self.frame = frame;
        CGFloat width = frame.size.width - kMarginLeft - kMarginRight;
        CGFloat height = frame.size.height - kMarginTop - kMarginBottom;
        self.plotFrame = CGRectMake(kMarginLeft, kMarginTop, width, height);
        self.plotMin = plotMin;
        self.plotMax = plotMax;
        self.datas = [NSArray arrayWithArray:datas];
        self.titles = [NSArray arrayWithArray:titles];
        // plot view
        PAPlotView *plotView = [[PAPlotView alloc] initWithFrame:self.plotFrame min:plotMin max:plotMax datas:datas type:PAPlotTypeTheLastOneWithGrid];
        [self addSubview:plotView];
        // axis texts
        [self addXAxisTexts];
        [self addYAxisTexts];
        // X 坐标是否居中，目前固定为不居中，从左侧开始
        self.isXAxisCenter = false;
    }
    return self;
}

// MARK: Private Functions
- (void)addXAxisTexts {
    CGFloat left = self.plotFrame.origin.x;
    CGFloat top = self.plotFrame.origin.y;
    CGFloat height = self.plotFrame.size.height;
    NSInteger count = self.titles.count;
    CGFloat step = self.plotFrame.size.width / count;
    CGFloat halfStep = step / 2;
    if (!self.isXAxisCenter) {
        halfStep = 0;
    }
    CGFloat offset = left + halfStep - (kXAxisWidth / 2);
    
    for (NSInteger i = 0; i < count; i++) {
        CGFloat x = offset + (step * i);
        CGFloat y = top + height + kXAxisOffsetY;
        NSString *text = self.titles[i];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, kXAxisWidth, kXAxisHeight)];
        label.text = text;
        label.textColor = UIColorFromRGB(kXAxisColor);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:kXAxisFontSize];
        [self addSubview:label];
    }
}

- (void)addYAxisTexts {
    CGFloat top = self.plotFrame.origin.y;
    CGFloat height = self.plotFrame.size.height;
    CGFloat step = height / kYAxisRowCount;
    CGFloat valueStep = (self.plotMax - self.plotMin) / kYAxisRowCount;
    
    for (NSInteger i = 0; i <= kYAxisRowCount; i++) {
        CGFloat value = self.plotMin + (valueStep * i);
        NSString *text = [NSString stringWithFormat:@"%0.3f", value];
        CGFloat x = self.plotFrame.origin.x - kYAxisOffsetX - kYAxisWidth;
        CGFloat y = top + height - kYAxisHeight - (step * i);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, kYAxisWidth, kYAxisHeight)];
        label.text = text;
        label.textColor = UIColorFromRGB(kYAxisColor);
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:kYAxisFontSize];
        [self addSubview:label];
    }
}

@end
