//
//  CABasicAnimationViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/11.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()


@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _animationView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
    _animationView.backgroundColor = [UIColor purpleColor];
    _animationView.hidden = YES;
    [self.view addSubview:_animationView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    _imageView.image = [UIImage imageNamed:@"test.jpeg"];
    _imageView.hidden = YES;
    [self.view addSubview:_imageView];
}

@end
