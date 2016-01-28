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

/**
 *  将离散数据数组绘制成折线图
 *
 *  @param frame 绘图区域的范围
 *  @param min   坐标最小值，数据下限
 *  @param max   坐标最大值，数据上限
 *  @param datas 实际的数据，给CGFloat的数组；例如4.500%，给4.5
 *  @param type  图标类型，是否显示白点，底部方格，标注等等
 *
 *  @return 实例对象
 */
- (instancetype)initWithFrame:(CGRect)frame
                          min:(CGFloat)min
                          max:(CGFloat)max
                        datas:(NSArray *)datas
                         type:(PAPlotType)type;

/**
 *  更新折线图
 *
 *  @param datas 新的数据点
 */
- (void)updatePlotWithDatas:(NSArray *)datas;

@end
