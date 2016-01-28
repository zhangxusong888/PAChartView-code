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

@property (strong, nonatomic) PAPlotView *plotView;
@property (strong, nonatomic) PAChartView *chartView;

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
}

// Action
- (IBAction)testButtonTouched:(UIButton *)sender {
    CGFloat min = 3.5;
    CGFloat max = 6.5;
    NSArray *datas = @[@4.6, @4.8, @5.2, @4.9, @5.1, @5.3];
    NSArray *titles = @[@"9-21", @"9-22", @"9-23", @"9-24", @"9-25", @"9-26"];
    [self.plotView updatePlotWithDatas:datas min:min max:max];
    [self.chartView updateChartWithMin:min max:max datas:datas titles:titles];
}

// Private Functions
- (void)addPlotView {
    CGRect frame = CGRectMake(20, 100, 360, 137);
    CGFloat min = 4.5;
    CGFloat max = 5.5;
    NSArray *datas = @[@4.6, @4.8, @5.3, @5.2];
    PAPlotType type = PAPlotTypePointsAndLabels;
    self.plotView = [[PAPlotView alloc] initWithFrame:frame min:min max:max datas:datas type:type];
    [self.view addSubview:self.plotView];
}

- (void)addChartView {
    CGRect frame = CGRectMake(20, 320, 360, 180);
    CGFloat min = 4.3;
    CGFloat max = 5.5;
    NSArray *datas = @[@4.6, @4.8, @5.2, @4.9, @5.1, @5.3];
    NSArray *titles = @[@"10.21", @"10.22", @"10.23", @"10.24", @"10.25", @"10.26"];
    
    self.chartView = [[PAChartView alloc] initWithFrame:frame plotMin:min plotMax:max datas:datas titles:titles];
    [self.view addSubview:self.chartView];
}

@end
