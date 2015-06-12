//
//  MWWaveAndAroundView.m
//  ClickEffect
//
//  Created by MathewWang on 15/6/11.
//  Copyright (c) 2015年 Reese. All rights reserved.
//

#import "MWWaveAndAroundView.h"
#import <QuartzCore/QuartzCore.h>
#import "MWWaveView.h"

@interface MWWaveAndAroundView(){
    CGFloat margin; //旋转小球的离父视图的边距
    CGRect rect;
    CGFloat aroundR; //环绕的圆圈半径
    CGFloat maxScale; //小球放大的倍数
}

@end

@implementation MWWaveAndAroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        margin = 2.0f;
        rect=frame;
        aroundR = rect.size.width / 2.0f - self.waveCircelR * maxScale - margin;
        maxScale = 5.0f;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void) startToAround{
    CGFloat avegAngle = 2*M_PI / self.waveCircleNO;
    
    for (int i = 0; i < self.waveCircleNO; i++) {
        CGFloat x = aroundR * cos(avegAngle * i);
        CGFloat y = aroundR * sin(avegAngle * i);
        [self addOneWaveCircle:CGPointMake(rect.size.width / 2.0f + x, rect.size.height / 2.0f + y) andStartAngle:avegAngle * i andAnimationName:@"KCKeyframeAnimation_Position"];
    }

}

- (void) addOneWaveCircle:(CGPoint) circlePoint andStartAngle:(CGFloat) startAngle andAnimationName:(NSString*) animationName{
    
    MWWaveView* waveView = [[MWWaveView alloc] initWithFrame:CGRectMake(0, 0, self.waveCircelR * maxScale, self.waveCircelR * maxScale)];
    waveView.circleNO = 3;
    waveView.circleR = self.waveCircelR;
    waveView.maxScale = maxScale;
    waveView.isFilled = self.isFilled;
    waveView.center = circlePoint;
    
    [self.layer addSublayer:waveView.layer];
    
    [waveView startToWave];
    
    //3.添加动画到图层，添加动画后就会执行动画
    [waveView.layer addAnimation:[self getAnimation:startAngle] forKey:animationName];
    
}

- (CAKeyframeAnimation*) getAnimation:(CGFloat) startAngle{
    CGFloat endAngle = (startAngle == 0 ? 2*M_PI : -startAngle);
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(rect.size.width/2,rect.size.height/2) radius:aroundR startAngle:startAngle endAngle:endAngle clockwise:NO];
    
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyframeAnimation.path=path.CGPath;//设置path属性
    CGPathRelease(path.CGPath);//释放路径对象
    //设置其他属性
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime()+0.5;//设置延迟2秒执行
    keyframeAnimation.repeatCount=HUGE_VALF;//设置无限循环
    
    return keyframeAnimation;
}

@end
