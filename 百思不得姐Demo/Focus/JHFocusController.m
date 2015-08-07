//
//  JHFocusController.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/22.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHFocusController.h"
#import "UIBarButtonItem+JHBarButtonExt.h"
#import "JHAddFocusController.h"
#import "JHLoginController.h"
@interface JHFocusController ()


@end

@implementation JHFocusController

- (void)viewDidLoad {
    [super viewDidLoad];
    JHSetBackgroundColor();
    // 添加导航栏左边的关注按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightImageName:@"friendsRecommentIcon-click" target:self action:@selector(barButtonClicked:)];
}
// 检查导航栏按钮点击
- (void)barButtonClicked:(UIButton *)button{
    // 导航栏左边按钮被点
    if (button == self.navigationItem.leftBarButtonItem.customView) {
        JHAddFocusController *nextVC = [[JHAddFocusController alloc] init];
        [self.navigationController pushViewController:nextVC animated:YES];
    }
}
- (IBAction)loginBtnClicked {
    JHLoginController *loginVC = [[JHLoginController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
    
}

@end
