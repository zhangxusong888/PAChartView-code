//
//  ViewController.m
//  PAChartView-code
//
//  Created by admin on 16/1/18.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "PAPlotView.h"
#import "PAChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addPlotView];
    [self addChartView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self addPlotView];
//    [self addChartView];
}

// Private Functions
- (void)addPlotView {
    CGRect frame = CGRectMake(20, 100, 360, 200);
    CGFloat min = 4.3;
    CGFloat max = 5.5;
    NSArray *datas = @[@4.6, @4.8, @5.2];
    PAPlotType type = PAPlotTypePointsAndLabels;
    PAPlotView * plotView = [[PAPlotView alloc] initWithFrame:frame min:min max:max datas:datas type:type];
    [self.view addSubview:plotView];
}

- (void)addChartView {
    CGRect frame = CGRectMake(20, 320, 360, 260);
    CGRect plotFrame = CGRectMake(60, 20, 280, 200);
    CGFloat min = 4.3;
    CGFloat max = 5.5;
    NSArray *datas = @[@4.6, @4.8, @5.2, @4.9, @5.1, @5.3];
    NSArray *titles = @[@"10-21", @"10-22", @"10-23", @"10-24", @"10-25", @"10-26"];
    
    PAChartView *chartView = [[PAChartView alloc] initWithFrame:frame plotFrame:plotFrame plotMin:min plotMax:max datas:datas titles:titles];
    chartView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:chartView];
}

@end
