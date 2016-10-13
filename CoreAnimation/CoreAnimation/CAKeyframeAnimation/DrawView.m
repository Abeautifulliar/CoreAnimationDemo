//
//  DrawView.m
//  CoreAnimation
//
//  Created by etouch on 16/10/12.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()
@property(nonatomic, strong) UIBezierPath *path;
@property(nonatomic, strong) UIImageView *imageView;
@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
        _imageView.image = [UIImage imageNamed:@"test.jpeg"];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint curPoint = [touch locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    _path = path;
    
    [path moveToPoint:curPoint];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [_path addLineToPoint:point];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = _path.CGPath;
    animation.duration = 2;
    animation.repeatCount = MAXFLOAT;
    [self.subviews.firstObject.layer addAnimation:animation forKey:nil];
}

- (void)drawRect:(CGRect)rect{
    [_path stroke];
}

@end
