//
//  PAPlotView.h
//  PAChartView
//
//  Created by admin on 16/1/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPlotType.h"

@interface PAPlotView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                          min:(CGFloat)min
                          max:(CGFloat)max
                        datas:(NSArray *)datas
                         type:(PAPlotType)type;

@end
