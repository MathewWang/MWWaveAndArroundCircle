//
//  MWWaveAndAroundView.h
//  ClickEffect
//
//  Created by MathewWang on 15/6/11.
//  Copyright (c) 2015年 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWWaveAndAroundView : UIView

//小球的个数
@property(nonatomic, assign) CGFloat waveCircleNO;
//小球的波动初始半径
@property(nonatomic, assign) CGFloat waveCircelR;
//小球是否填充
@property(nonatomic, assign) BOOL isFilled;

- (void) startToAround;
@end
