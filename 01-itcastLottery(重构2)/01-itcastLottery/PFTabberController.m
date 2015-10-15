//
//  PFTabberController.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/14.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFTabberController.h"
#import "PFTabBarButton.h"
#import "PFTabBar.h"

@interface PFTabberController()<PFTabBarDelegate>

@end

@implementation PFTabberController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.移除系统自带tabBar
//    [self.tabBar removeFromSuperview];
    
    
    // 2.添加自己的tabBar
    PFTabBar *tabBar = [[PFTabBar alloc]init];
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    tabBar.delegate = self;
    
    // 添加按钮
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [tabBar addTabButtonWithName:name selName:selName];
    }
    
}

// 代理方法tabbar
- (void)tabbar:(PFTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    
#warning 通过按钮的tag索引设置selectedIndex属性切换控制器
    self.selectedIndex = to;
}



@end
