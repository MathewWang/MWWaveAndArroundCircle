//
//  ViewController.m
//  MWWaveAndArroundCircle
//
//  Created by MathewWang on 15/6/12.
//  Copyright (c) 2015年 MathewWang. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MWWaveView.h"
#import "MWWaveAndAroundView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = [UIScreen mainScreen].bounds;
    
    //加上最底层的波纹效果
    MWWaveView* waveView = [[MWWaveView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    waveView.circleNO = 3;
    waveView.circleR = 30;
    waveView.maxScale = 5;
    waveView.isFilled = YES;
    waveView.center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    [self.view addSubview:waveView];
    
    [waveView startToWave];
    
    //加上环绕转动的小球
    MWWaveAndAroundView* waveAndRunView = [[MWWaveAndAroundView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    waveAndRunView.center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    waveAndRunView.waveCircelR = 3.0f;
    waveAndRunView.waveCircleNO = 2; //目前最多只支持两个
    waveAndRunView.isFilled = YES;
    
    [self.view addSubview:waveAndRunView];
    
    [waveAndRunView startToAround];
    
    //加上海贼王，桑尼号的旗帜，完美了
    UIImageView* headerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OnePiece"]];
    headerView.frame = CGRectMake(0, 0, 100, 100);
    headerView.contentMode = UIViewContentModeScaleAspectFill;
    headerView.layer.cornerRadius = 50;
    headerView.layer.masksToBounds = YES;
    headerView.center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    
    [self.view addSubview:headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
