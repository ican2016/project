//
//  PFMeViewController.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/15.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFMeViewController.h"
#import "UIImage+MJ.h"


@interface PFMeViewController()
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation PFMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *normal = [UIImage resizedImageWithName:@"RedButton"];
    UIImage *high = [UIImage resizedImageWithName:@"RedButtonPressed"];
    
    [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.5];
//    [normal resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//    [high stretchableImageWithLeftCapWidth:high.size.width*0.5 topCapHeight:high.size.height*0.5];
//    [normal resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile]
    
    [self.loginButton setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:high forState:UIControlStateHighlighted];
}

@end
