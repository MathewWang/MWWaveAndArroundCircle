//
//  MWWaveView.h
//  ClickEffect
//
//  Created by MathewWang on 15/6/11.
//  Copyright (c) 2015年 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWWaveView : UIView

//设置圆弧的个数
@property(nonatomic, assign) NSInteger circleNO;
//设置圆弧的随机颜色取样池, 默认为灰色
@property(nonatomic, strong) NSArray* colors;
//设置圆圈放大的倍数
@property(nonatomic, assign) CGFloat maxScale;
//设置圆圈的初始半径
@property(nonatomic, assign) CGFloat circleR;
//设置是否填充
@property(nonatomic, assign) BOOL isFilled;

//动画开始
- (void) startToWave;
@end
