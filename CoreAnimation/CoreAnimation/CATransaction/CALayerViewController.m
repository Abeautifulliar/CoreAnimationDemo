//
//  CALayerViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/13.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CALayerViewController.h"
#define angle2radion(angle) ((angle) / 180.0 * M_PI)

@interface CALayerViewController ()

@end

@implementation CALayerViewController{
    CALayer *_layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _layer = [CALayer layer];
    // 可动画属性
    _layer.bounds = CGRectMake(0, 0, 100, 100);          // 大小
    _layer.position = CGPointMake(100, 100);             // 位置
    _layer.backgroundColor = [UIColor redColor].CGColor; // 颜色
    _layer.opacity = 0.9;                                // 透明度
    
    // 把layer添加到view的layer上
    [self.view.layer addSublayer:_layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
#pragma mark - layer随机旋转
    _layer.transform = CATransform3DMakeRotation(angle2radion(arc4random_uniform(360) + 1), 0, 0, 1);
    _layer.position = CGPointMake(arc4random_uniform(200) + 20, arc4random_uniform(400) + 50);
    _layer.cornerRadius = arc4random_uniform(50);
    _layer.backgroundColor = [self randomColor].CGColor;
    _layer.borderWidth = arc4random_uniform(10);
    _layer.borderColor = [self randomColor].CGColor;
    
#pragma mark - 关闭默认的隐式动画效果
    UITouch *t = touches.anyObject;        // 获取触摸对象
    CGPoint p = [t locationInView:t.view]; // 获取手指的位置
    
    // 事务
    [CATransaction begin];                 // 开启事务
    [CATransaction setDisableActions:YES]; // 禁用隐式动画
    
    _layer.position = p; // 更改可动画属性（这里是更改位置）
    
    [CATransaction commit]; // 提交事务
}

- (UIColor *)randomColor {
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end
