//
//  CABasicAnimationScaleViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/11.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CABasicAnimationScaleViewController.h"

@interface CABasicAnimationScaleViewController ()

@end

@implementation CABasicAnimationScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.animationView.hidden = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 1.创建动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    // 2.设置动画变化样式
    // transform.scale.x 沿x轴缩放
    // transform.scale.y 沿y轴缩放
    // 同时缩放
    animation.keyPath = @"transform.scale";
    
    // 起始位置
        animation.fromValue = @(1);
        // 结束位置
        animation.toValue = @(2.5);
    
    // 累加值
   // animation.byValue = @(20);
    // 动画时长
    animation.duration = 3;
    // 重复次数
    animation.repeatCount = 2;
    
    // 核心动画结束后，不想回到原来的位置，添加以下两行代码
    // 设置动画执行完成要保持最新的效果
    animation.fillMode = kCAFillModeForwards;
    // 取消动画反弹（设置动画完成的时候不要移除动画）
    animation.removedOnCompletion = NO;
    
    // 设置变化的锚点 默认值(0.5, 0.5)中心点
    //self.animationView.layer.anchorPoint = CGPointMake(0, 0);
    [self.animationView.layer addAnimation:animation forKey:nil];
}

@end
