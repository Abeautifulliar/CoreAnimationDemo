//
//  CustomPresentAnimationController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/28.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "CustomPresentAnimationController.h"
#import "SecondViewController.h"
#import "ELTransition.h"
#import "ELButton.h"

@interface CustomPresentAnimationController ()

@end

@implementation CustomPresentAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    ELButton *presentButton = [[ELButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-100, CGRectGetHeight(self.view.frame)-200, 200, 50)];
    presentButton.layer.masksToBounds = YES;
    presentButton.layer.cornerRadius = 25;
    [presentButton setBackgroundColor:[UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1]];
    [presentButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
}


- (void)btnClick{
    SecondViewController *secondVC = [SecondViewController new];
    secondVC.transitioningDelegate = self;
    [self performSelector:@selector(presentViewController:animated:completion:) withObject:secondVC afterDelay:2.3];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[ELTransition alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
