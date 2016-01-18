//
//  PAChartView.h
//  PAChartView-code
//
//  Created by admin on 16/1/18.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAChartView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                    plotFrame:(CGRect)plotFrame
                      plotMin:(CGFloat)plotMin
                      plotMax:(CGFloat)plotMax
                        datas:(NSArray *)datas
                       titles:(NSArray *)titles;

@end
