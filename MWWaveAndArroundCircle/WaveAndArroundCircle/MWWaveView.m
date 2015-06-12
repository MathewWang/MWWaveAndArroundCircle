//
//  MWWaveView.m
//  ClickEffect
//
//  Created by MathewWang on 15/6/11.
//  Copyright (c) 2015年 Reese. All rights reserved.
//

#import "MWWaveView.h"
#import <QuartzCore/QuartzCore.h>

@interface MWWaveView(){
    CGPoint waveCenter;
}

@end

@implementation MWWaveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //以view的中点为波纹展开的中心点
        waveCenter = CGPointMake(frame.size.width / 2.0f, frame.size.height / 2.0f);
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void) startToWave{
    for (int i = 1; i <= self.circleNO; i++) {
        [self performSelector:@selector(addCircleLayer) withObject:self afterDelay:i * 0.2];
    }
}

//调用一次增加一个圆弧
- (void) addCircleLayer{
    CALayer *waveLayer=[CALayer layer];
    waveLayer.frame = CGRectMake(waveCenter.x - self.circleR, waveCenter.y - self.circleR, self.circleR*2, self.circleR*2);
    UIColor* waveColor;
    if (_colors && _colors > 0) {
        int colorInt=arc4random()%self.colors.count;
        waveColor = [self.colors objectAtIndex:colorInt];
    }else{
        waveColor =[UIColor grayColor];
    }
    
    if (self.isFilled) {
        waveLayer.backgroundColor = waveColor.CGColor;
    }else{
        waveLayer.borderColor =waveColor.CGColor;
        waveLayer.borderWidth =0.5;
    }
    waveLayer.cornerRadius =self.circleR;
    
    [self.layer addSublayer:waveLayer];
    
    [self scaleBegin:waveLayer];
}

//将圆圈放大
-(void)scaleBegin:(CALayer *)aLayer
{
    if (aLayer.transform.m11<self.maxScale) {
        if (aLayer.transform.m11==1.0) {
            [aLayer setTransform:CATransform3DMakeScale( 1.1, 1.1, 1.0)];
            
        }else{
            [aLayer setTransform:CATransform3DScale(aLayer.transform, 1.1, 1.1, 1.0)];
        }
        aLayer.opacity = aLayer.opacity * 0.8;
        [self performSelector:_cmd withObject:aLayer afterDelay:0.05];
        
    }else {
        
        [aLayer removeFromSuperlayer];
        [self addCircleLayer];
    }
}

@end
