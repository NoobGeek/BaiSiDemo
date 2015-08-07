//
//  JHLoginController.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/23.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHLoginController.h"
#import "JHLoginButton.h"


@interface JHLoginController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayoutConstraint;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIView *loginBlock;
@property (strong, nonatomic) IBOutlet JHLoginButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIView *registerBlock;



@end

@implementation JHLoginController

static int switchX = 0;
/** 右上角按钮的响应方法,登陆和注册页面的切换 */
- (IBAction)loginOrRegister:(id)sender {
    
    UIButton *btn = ((UIButton *)sender);
    btn.userInteractionEnabled = NO;
    if (switchX == 0) {
        [btn setTitle:@"马上登陆?" forState:UIControlStateNormal];
        [btn setTitle:@"马上登陆?" forState:UIControlStateHighlighted];
        self.leftLayoutConstraint.constant = -JHScreenBounds.size.width;
        [UIView animateWithDuration:animationDuration animations:^{
//            self.loginBlock.x = 0;
//            self.registerBlock.x = JHScreenBounds.size.width;
            [self.view layoutIfNeeded];
        }completion:^(BOOL finished) {
            btn.userInteractionEnabled = YES;
            switchX = 1;
        }];
    }else {
        [btn setTitle:@"注册账号" forState:UIControlStateNormal];
        [btn setTitle:@"注册账号" forState:UIControlStateHighlighted];
                self.leftLayoutConstraint.constant = 0;
        [UIView animateWithDuration:animationDuration animations:^{
//            self.loginBlock.x = -JHScreenBounds.size.width;
//            self.registerBlock.x = 0;
            [self.view layoutIfNeeded];
        }completion:^(BOOL finished) {
            btn.userInteractionEnabled = YES;
            switchX = 0;
        }];
    }
}

/** 关闭页面 */
- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
