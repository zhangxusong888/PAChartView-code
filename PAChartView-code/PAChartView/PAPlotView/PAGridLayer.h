//
//  PAGridLayer.h
//  PAChartView
//
//  Created by admin on 16/1/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PAGridLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame
                          row:(NSInteger)row
                       column:(NSInteger)column;

@end
