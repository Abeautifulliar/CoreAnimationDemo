//
//  CAKeyframeAnimationBezierPathViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/12.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CAKeyframeAnimationBezierPathViewController.h"
#import "DrawView.h"

@interface CAKeyframeAnimationBezierPathViewController ()
@property(nonatomic, strong) UIBezierPath *path;
@end

@implementation CAKeyframeAnimationBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DrawView *view = [[DrawView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [self.view insertSubview:view atIndex:0];
}
@end
