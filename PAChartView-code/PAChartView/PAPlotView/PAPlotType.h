//
//  PAPlotType.h
//  PAChartView
//
//  Created by admin on 16/1/18.
//  Copyright © 2016年 admin. All rights reserved.
//

#ifndef PAPlotType_h
#define PAPlotType_h

/**
 *  折线图的类型
 */
typedef NS_ENUM(NSUInteger, PAPlotType) {
    /**
     *  显示所有的圆点和标注，还有底部网格
     */
    PAPlotTypePointsAndLabels= 1,
    /**
     *  显示所有的圆点，没有标注
     */
    PAPlotTypePointsAll,
    /**
     *  只显示中间的圆点，两头的不显示
     */
    PAPlotTypePointsMiddle,
    /**
     *  只显示最后一个圆点和标注
     */
    PAPlotTypeTheLastOneOnly,
    /**
     *  只显示最后一个圆点，底部网格
     */
    PAPlotTypeTheLastOneWithGrid
};

#endif /* PAPlotType_h */
