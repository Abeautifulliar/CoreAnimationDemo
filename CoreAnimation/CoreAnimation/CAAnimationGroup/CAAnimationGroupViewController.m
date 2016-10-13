//
//  CAAnimationGroupViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/13.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.animationView.hidden = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 组动画：同时缩放，旋转，平移
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 5;
    
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @0.5;
    
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @(arc4random_uniform(M_PI));
    
    CABasicAnimation *position = [CABasicAnimation animation];
    position.keyPath = @"position";
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(200),
                                                             arc4random_uniform(200))];
    
    group.animations = @[
                         scale,
                         rotation,
                         position
                         ];
    [self.animationView.layer addAnimation:group forKey:nil];
}

@end
