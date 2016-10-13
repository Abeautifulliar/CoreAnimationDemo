//
//  CAKeyframeAnimationRotationViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/11.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CAKeyframeAnimationRotationViewController.h"

#define angle2radion(a) ((a) / 180.0 * M_PI) // 角度转弧度

@interface CAKeyframeAnimationRotationViewController ()

@end

@implementation CAKeyframeAnimationRotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.imageView.hidden = NO;
    self.imageView.layer.anchorPoint = CGPointZero;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 添加核心动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    // 旋转
    anim.keyPath = @"transform.rotation";
    anim.values = @[
                    @(angle2radion(-5)),
                    @(angle2radion(5)),
                    @(angle2radion(-5))
                    ];
    anim.duration = 0.5;
    // 设置动画重复次数
    anim.repeatCount = MAXFLOAT;
    [self.imageView.layer addAnimation:anim forKey:nil];
}


@end
