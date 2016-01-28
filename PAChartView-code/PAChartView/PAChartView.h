//
//  PAChartView.h
//  PAChartView-code
//
//  Created by admin on 16/1/18.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAChartView : UIView

/**
 *  带坐标轴的折线图表
 *
 *  @param frame     整体的frame
 *  @param plotMin   折线图的数据下限
 *  @param plotMax   折线图的数据上限
 *  @param datas     数据，CGFloat的数组，不要带%；比如4.5，标注会显示4.500%
 *  @param titles    横坐标的文字
 *
 *  @return 图表对象实例
 */
- (instancetype)initWithFrame:(CGRect)frame
                      plotMin:(CGFloat)plotMin
                      plotMax:(CGFloat)plotMax
                        datas:(NSArray *)datas
                       titles:(NSArray *)titles;

/**
 *  更新带坐标轴的折线图表
 *
 *  @param min     折线图的数据下限
 *  @param max     折线图的数据上限
 *  @param datas   数据
 *  @param titiles 文字
 */
- (void)updateChartWithMin:(CGFloat)min
                       max:(CGFloat)max
                     datas:(NSArray *)datas
                    titles:(NSArray *)titiles;

@end
