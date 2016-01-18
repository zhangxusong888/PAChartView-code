//
//  PAMarkLayer.h
//  PAChartView
//
//  Created by admin on 16/1/15.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PAPlotType.h"

@interface PAMarkLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame
                   xAxisArray:(NSArray *)xValues
                   yAxisArray:(NSArray *)yValues
                 actrualDatas:(NSArray *)datas
                    chartType:(PAPlotType)type;

@end
