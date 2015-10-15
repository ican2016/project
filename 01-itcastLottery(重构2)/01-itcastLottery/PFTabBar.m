//
//  PFTabBar.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/15.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFTabBar.h"
#import "PFTabBarButton.h"

#define PFTabBarButtonCount 5

@interface PFTabBar()

// 记录当前选中按钮
@property (weak, nonatomic)PFTabBarButton *selectedButton;

@end

@implementation PFTabBar

- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName
{
    PFTabBarButton *button = [PFTabBarButton buttonWithType:UIButtonTypeCustom];
    
    
    // 设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    
    // 添加按钮
    [self addSubview:button];
    
#warning UIControlEventTouchDown 当我们手指按下去就会触发
    // 添加监听(需要注意，这里的点击事件使用TouchDown)
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
    
}

#warning 父类中的frame设置完成后，就可以在layoutSubviews中设置子控件的尺寸，掉用layoutSubviews之前，父类的frame已经设置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int buttonCount = self.subviews.count;
    for (int i = 0; i < buttonCount; i++) {
        // 获取tabBar中按钮
        PFTabBarButton *button = self.subviews[i];
        button.tag = i;

        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width/buttonCount;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i*buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}


/*
 normal : 普通状态
 highlighted : 高亮状态
 seleced : 选中状态
 disable : 是否可以关闭按钮
 
 */

/*
 监听按钮点击
*/
- (void)buttonClick:(PFTabBarButton *)button
{
    
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabbar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    
    // 1.当前选中按钮取消选中
    self.selectedButton.selected = NO;
        
        
    // 2.新点击按钮选中
    button.selected = YES;
        
        
    // 3.新点击按钮就成为"当前选中按钮"
    self.selectedButton = button;
        

}

@end
