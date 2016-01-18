//
//  PAPathLayer.h
//  PAChartView
//
//  Created by admin on 16/1/14.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PAPathLayer : CAGradientLayer

- (instancetype)initWithFrame:(CGRect)frame
                   xAxisArray:(NSArray *)xValues
                   yAxisArray:(NSArray *)yValues;

@end
