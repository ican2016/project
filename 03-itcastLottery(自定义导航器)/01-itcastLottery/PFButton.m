//
//  PFButton.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/15.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFButton.h"
#import <Availability.h>

#define IOS7 [[UIDevice currentDevice].systemVersion doubleValue] == 7.0

@interface PFButton()

@property (strong, nonatomic)UIFont *titleFont;

@end

@implementation PFButton

// 当一个对象从xib或者storyboard加载完成后，就会掉用一次
//- (void)awakeFromNib
//{
//    NSLog(@"awakeFromNib");
//}

// 从文件中解析一个对象时掉用（非代码创建按钮掉用）
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];

    }
    return self;
}


// 代码中创建按钮时掉用
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    
    self.titleFont = [UIFont systemFontOfSize:17];
    self.titleLabel.font = self.titleLabel.font;
    
    // 图标居中
    self.imageView.contentMode = UIViewContentModeCenter;
    
}

// 重写按钮中文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    
    NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
    // 计算字体本身的长度
    CGFloat titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


// 重写按钮中图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 25;
    CGFloat imageY = 0;
    CGFloat imageX = contentRect.size.width-imageW;
    CGFloat imageH = contentRect.size.height;;
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
