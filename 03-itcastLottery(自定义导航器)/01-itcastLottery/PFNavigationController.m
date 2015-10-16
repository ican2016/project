//
//  PFNavigationController.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/15.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFNavigationController.h"

@implementation PFNavigationController

// initialize只会在程序打开之后执行一次，如果类中只初始化一次的动作，全都在initalize中方法中执行
+ (void)initialize
{
    // 1.设置导航栏主题(全局设置)
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    
    // 1.1.设置全局导航栏的背景色
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    

    // 1.2.设置全局导航栏标题文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];   // 文字颜色
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18.0f];    // 文字大小
    [navBar setTitleTextAttributes:attrs];
    
    
    //  2.0.设置UIBarButtonItem主题(全局设置)
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];

    // 2.1.设置barButtonItem的属性值
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor redColor];         // 文字颜色
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10.0f];       // 文字大小
    
    [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
}

// 重写navigation的push方法，执行push方法之前先隐藏tabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}


@end
