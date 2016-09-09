//
//  WYButton.m
//  UIButton控件封装
//
//  Created by 王一 on 16/9/9.
//  Copyright © 2016年 wangyi. All rights reserved.
//

#import "WYButton.h"
#import "UIView+WYExtension.h"

@implementation WYButton

//图片与文字上下分离,图片大，文字小，图片与文字上下分离
-(instancetype)initWithFrame:(CGRect)frame bigImageName:(NSString *)imageName buttonTitle:(NSString *)title FontSize:(CGFloat) fontSize{
    self = [super initWithFrame:frame];
    if (self) {
        self.indexNum = 1;
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return self;
}

//图片与文字上下分离,图片中等大小，文字中等大小
-(instancetype)initWithFrame:(CGRect)frame mediumImageName:(NSString *)imageName buttonTitle:(NSString *)title FontSize:(CGFloat) fontSize{
    self = [super initWithFrame:frame];
    if (self) {
        self.indexNum = 2;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return self;
}

//图片与文字混合，方向自定义
- (instancetype)initWithFrame:(CGRect)frame buttonTitle:(NSString *)title backgroundImage:(NSString *)backgroundImage FontSize:(CGFloat) fontSize ImageName:(NSString *)imageName AlignMode:(wy_imageTitleAlignType)wy_imageTitletype{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        self.contentMode = UIViewContentModeCenter;
    }
    
    [self setButtonImagePosition:wy_imageTitletype];
    
    return self;
}

//图片与文字混合，设置方向
- (void)setButtonImagePosition:(wy_imageTitleAlignType)wy_imageTitletype{
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    CGFloat space = 1.0;
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (wy_imageTitletype) {
        case wy_imageUpTitleDown:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case wy_imageLeftTitleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case wy_imageDownTitleUp:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case wy_imageRightTitleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    switch (self.indexNum) {
        case 1:
        {
            // 调整图片
            self.imageView.x = 0;
            self.imageView.y = 0;
            self.imageView.width = self.width;
            self.imageView.height = self.imageView.width;
            
            // 调整文字
            self.titleLabel.x = 0;
            self.titleLabel.y = self.imageView.height;
            self.titleLabel.width = self.width;
            self.titleLabel.height = self.height - self.imageView.height;
        }
            break;
            
        case 2:
        {
            // 调整图片
            self.imageView.y = self.height * 0.1;
            self.imageView.width = self.width * 0.6;
            self.imageView.height = self.imageView.width;
            self.imageView.centerX = self.width * 0.5;
            
            // 调整文字
            self.titleLabel.x = 0;
            self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
            self.titleLabel.width = self.width;
            self.titleLabel.height = self.height - self.titleLabel.y;
        }
            
        default:
            break;
    } 
}

@end
