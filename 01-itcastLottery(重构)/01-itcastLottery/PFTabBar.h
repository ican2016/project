//
//  PFTabBar.h
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/15.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFTabBar;
@protocol PFTabBarDelegate <NSObject>

@optional
- (void)tabbar:(PFTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface PFTabBar : UIView

@property (weak, nonatomic)id<PFTabBarDelegate> delegate;

@end
