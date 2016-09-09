//
//  ViewController.m
//  UIButton控件封装
//
//  Created by 王一 on 16/9/9.
//  Copyright © 2016年 wangyi. All rights reserved.
//
// 屏幕尺寸
#define WYScreenW [UIScreen mainScreen].bounds.size.width
#define WYScreenH [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "WYButton.h"

@interface ViewController ()
/**
 *  发布按钮
 */
@property(nonatomic,strong)WYButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"按钮常用封装--王一";
    
    [self test1];
    [self test2];
    [self test3];
}

//样式1
-(void)test1{
    CGRect frame = CGRectMake(WYScreenW * 0.5 - 60 * 0.5, 100, 60, 80);
    self.testBtn = [[WYButton alloc]initWithFrame:frame bigImageName:@"publish-video" buttonTitle:@"段子" FontSize:15];
    self.testBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
    [self.view addSubview:self.testBtn];
}
//样式2
-(void)test2{
    CGRect frame = CGRectMake(WYScreenW * 0.5 - 60 * 0.5, 200, 60, 60);
    self.testBtn = [[WYButton alloc]initWithFrame:frame mediumImageName:@"publish-video" buttonTitle:@"我的爱好" FontSize:13];
    self.testBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13.0];
    [self.view addSubview:self.testBtn];
}
//样式3
-(void)test3{
    
    NSInteger magin = WYScreenW * 0.25;
    NSInteger maginStart = (magin - 60) * 0.5;
    
    CGRect frame1 = CGRectMake(maginStart, 300, 60, 60);
    WYButton *testBtn1 = [[WYButton alloc]initWithFrame:frame1 buttonTitle:@"发布" backgroundImage:@"releaseBtn" FontSize:13 ImageName:@"release" AlignMode:wy_imageLeftTitleRight];
    [self.view addSubview:testBtn1];
    
    CGRect frame2 = CGRectMake(magin + maginStart, 300, 60, 60);
    WYButton *testBtn2 = [[WYButton alloc]initWithFrame:frame2 buttonTitle:@"发布" backgroundImage:@"releaseBtn" FontSize:13 ImageName:@"release" AlignMode:wy_imageUpTitleDown];
    [self.view addSubview:testBtn2];
    
    CGRect frame3 = CGRectMake(2 * magin + maginStart, 300, 60, 60);
    WYButton *testBtn3 = [[WYButton alloc]initWithFrame:frame3 buttonTitle:@"发布" backgroundImage:@"releaseBtn" FontSize:13 ImageName:@"release" AlignMode:wy_imageRightTitleLeft];
    [self.view addSubview:testBtn3];
    
    CGRect frame4 = CGRectMake(3 * magin + maginStart, 300, 60, 60);
    WYButton *testBtn4 = [[WYButton alloc]initWithFrame:frame4 buttonTitle:@"发布" backgroundImage:@"releaseBtn" FontSize:13 ImageName:@"release" AlignMode:wy_imageDownTitleUp];
    [self.view addSubview:testBtn4];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
