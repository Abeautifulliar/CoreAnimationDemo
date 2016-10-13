//
//  ViewController.m
//  CoreAnimation
//
//  Created by etouch on 16/10/11.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UITableView *_tableView;
    NSArray *_dataSource;
    NSArray *_controllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataSource = @[
                    @"CABasicAnimationPosition(基本动画移动)",
                    @"CABasicAnimationScale(基本动画缩放)",
                    @"CABasicAnimationRotate(基本动画旋转)",
                    @"CAKeyframeAnimation(关键帧动画抖动)",
                    @"CAKeyframeAnimation(关键帧动画贝塞尔曲线)",
                    @"CAAnimationGroup(组动画)",
                    @"非根视图layer隐式动画"
                    ];
    _controllers = @[
                    @"CABasicAnimationPostionViewController",
                    @"CABasicAnimationScaleViewController",
                    @"CABasicAnimationRotateViewController",
                    @"CAKeyframeAnimationRotationViewController",
                    @"CAKeyframeAnimationBezierPathViewController",
                    @"CAAnimationGroupViewController",
                    @"CALayerViewController"
                    ];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
        cell.textLabel.text = _dataSource[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[[NSClassFromString(_controllers[indexPath.row]) alloc] init] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
