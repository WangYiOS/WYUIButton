//
//  WYButton.h
//  UIButton控件封装
//
//  Created by 王一 on 16/9/9.
//  Copyright © 2016年 wangyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger , wy_imageTitleAlignType) {
    wy_imageLeftTitleRight, //图片左，文字右
    wy_imageRightTitleLeft,//图片右，文字左
    wy_imageUpTitleDown,//图片上，文字下
    wy_imageDownTitleUp,//图片下，文字上
};

@interface WYButton : UIButton
/**
 *  区分按钮创建样式标记
 */
@property(nonatomic,assign)NSInteger indexNum;


/**
 *  图片与文字上下分离,图片大，文字小，图片与文字上下分离
 *
 *  @param frame     尺寸
 *  @param imageName 按钮图片
 *  @param title     文字
 *  @param fontSize  文字大小
 *
 *  @return 2016年09月10日00:28:01 王一
 */
-(instancetype)initWithFrame:(CGRect)frame bigImageName:(NSString *)imageName buttonTitle:(NSString *)title FontSize:(CGFloat) fontSize;

/**
 *  图片与文字上下分离,图片中等大小，文字中等大小
 *
 *  @param frame     尺寸
 *  @param imageName 按钮图片
 *  @param title     文字
 *  @param fontSize  文字代销
 *
 *  @return 2016年09月10日00:27:02 王一
 */
-(instancetype)initWithFrame:(CGRect)frame mediumImageName:(NSString *)imageName buttonTitle:(NSString *)title FontSize:(CGFloat) fontSize;

/**
 *  图片与文字混合
 *
 *  @param frame           尺寸
 *  @param title           文字
 *  @param backgroundImage 按钮背景图片
 *  @param fontSize        文字大小
 *  @param imageName       按钮图片
 *  @param imageTitletype  图片与文字方向
 *
 *  @return 2016年09月10日00:26:11 王一
 */
- (instancetype)initWithFrame:(CGRect)frame buttonTitle:(NSString *)title backgroundImage:(NSString *)backgroundImage FontSize:(CGFloat) fontSize ImageName:(NSString *)imageName AlignMode:(wy_imageTitleAlignType)wy_imageTitletype;

/**
 *  设置图片与文字的方向
 *
 *  @param wy_imageTitletype 方向
 */
- (void)setButtonImagePosition:(wy_imageTitleAlignType)wy_imageTitletype;

@end
