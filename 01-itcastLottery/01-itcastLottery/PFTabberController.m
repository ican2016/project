//
//  PFTabberController.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/14.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFTabberController.h"
#import "PFTabBarButton.h"

@interface PFTabberController()

// 记录当前选中按钮
@property (weak, nonatomic)UIButton *selectedButton;

@end

@implementation PFTabberController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.移除系统自带tabBar
    [self.tabBar removeFromSuperview];
    
    
    // 2.添加自己的tabBar
    UIView *tabBar = [[UIView alloc]init];
    tabBar.backgroundColor  = [UIColor orangeColor];
    tabBar.frame = self.tabBar.frame;
    [self.view addSubview:tabBar];
    
    
    // 3.自定义的tabBar上添加5个按钮
    for (int i = 0; i < 5; i++) {
        // 创建按钮
        PFTabBarButton *button = [PFTabBarButton buttonWithType:UIButtonTypeCustom];
        
        // 按钮添加tag标示
        button.tag = i;
        
        
        // 设置背景图片
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i+1];
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        
        NSString *selecedName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [button setBackgroundImage:[UIImage imageNamed:selecedName] forState:UIControlStateSelected];
        
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = tabBar.frame.size.width*0.2;
        CGFloat buttonH = tabBar.frame.size.height;
        CGFloat buttonX = i*buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        // 添加按钮
        [tabBar addSubview:button];
        
        
#warning UIControlEventTouchDown 当我们手指按下去就会触发
        // 添加监听(需要注意，这里的点击事件使用TouchDown)
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        
        // 默认选中第0个按钮
        if (i == 0) {
            [self buttonClick:button];
        }
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
- (void)buttonClick:(UIButton *)button
{
    // 1.当前选中按钮取消选中
    self.selectedButton.selected = NO;
    
    
    // 2.新点击按钮选中
    button.selected = YES;
    
    
    // 3.新点击按钮就成为"当前选中按钮"
    self.selectedButton = button;
    
    
#warning 通过按钮的tag索引设置selectedIndex属性切换控制器
    // 4.切换控制器
    self.selectedIndex = button.tag;
}

@end
