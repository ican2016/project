//
//  PFBuyController.m
//  01-itcastLottery
//
//  Created by Apple-JF on 15/10/15.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PFBuyController.h"
#import "PFButton.h"

@interface PFBuyController()

- (IBAction)clickButton:(PFButton *)sender;

@end

@implementation PFBuyController

static BOOL flag;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)clickButton:(PFButton *)sender {
//    [UIView animateWithDuration:0.05f animations:^{
    NSLog(@"%d",flag);
        if (flag == 1) {
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            flag = 0;
        }else{
            sender.imageView.transform = CGAffineTransformMakeRotation(-M_PI);
            flag = 1;
        }
//    }];
    
}
@end
