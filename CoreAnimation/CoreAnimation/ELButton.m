//
//  ELButton.m
//  CoreAnimation
//
//  Created by etouch on 16/10/28.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "ELButton.h"
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self
@interface ELButton ()

@property (nonatomic, strong) CAShapeLayer *whiteLayer;

@end

@implementation ELButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _whiteLayer = [[CAShapeLayer alloc] init];
        CGFloat radius = CGRectGetHeight(self.bounds) / 4;
        _whiteLayer.frame = CGRectMake(0, 0, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
        CGPoint center = CGPointMake(CGRectGetHeight(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
        CGFloat startAngle = 0 - M_PI_2;
        CGFloat endAngle = M_PI * 2 - M_PI_2;
        BOOL clockwise = true;
        _whiteLayer.path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise].CGPath;
        _whiteLayer.fillColor = nil;
        _whiteLayer.strokeColor = [UIColor whiteColor].CGColor;
        _whiteLayer.lineWidth = 1;
        _whiteLayer.strokeEnd = 0.4;
        _whiteLayer.hidden = YES;
        
        [self initUI];
    }
    return self;
}


- (void)initUI{
    [self setBackgroundColor:[UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1]];
    [self addTarget:self action:@selector(animationWithShake) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(animationWithScaleSmall) forControlEvents:UIControlEventTouchUpInside];
}

- (void)animationWithShake{
    WeakSelf(ws);
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         ws.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:nil];
    

}

- (void)animationWithScaleSmall{
    self.whiteLayer.hidden = NO;
    [self.layer addSublayer:_whiteLayer];
    
    WeakSelf(ws);
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         ws.transform = CGAffineTransformMakeScale(1, 1);
                     } completion:nil];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"bounds.size.width";
    scaleAnimation.fromValue = @(CGRectGetWidth(self.frame));
    scaleAnimation.toValue = @(CGRectGetHeight(self.frame));
    scaleAnimation.duration = 0.3;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:scaleAnimation forKey:nil];

    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = 0;
    rotate.toValue = @(M_PI * 2);
    rotate.duration = 0.2;
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotate.repeatCount = HUGE;
    rotate.fillMode = kCAFillModeForwards;
    rotate.removedOnCompletion = false;
    [_whiteLayer addAnimation:rotate forKey:rotate.keyPath];
    
    [self performSelector:@selector(addExpandAnimation) withObject:nil afterDelay:2];
}

- (void)addExpandAnimation{
    CABasicAnimation *expand = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expand.fromValue = @(1.0);
    expand.toValue = @(33.0);
    expand.duration = 0.3;
    expand.fillMode = kCAFillModeForwards;
    expand.removedOnCompletion = false;
    [self.layer addAnimation:expand forKey:nil];
    [_whiteLayer removeFromSuperlayer];
    [self performSelector:@selector(removeAllAnimation) withObject:nil afterDelay:1.5];
}

- (void)removeAllAnimation{
    [self.layer removeAllAnimations];
}
@end
