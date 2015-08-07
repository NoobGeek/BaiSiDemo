//
//  JHTabBarController.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/22.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHTabBarController.h"
#import "JHTabBar.h"
#import "JHTopicController.h"
#import "JHFocusController.h"
#import "JHNavigationController.h"
#import "JHMeController.h"
#import "JHPublishController.h"

@interface JHTabBarController ()



@end

@implementation JHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[[JHTabBar alloc] initWithFrame:CGRectMake(0, JHScreenBounds.size.height - 44, JHScreenBounds.size.width, 44)] forKeyPath:@"tabBar"];
    JHTabBar *tabBar = (JHTabBar *)self.tabBar;
    tabBar.controllerDelegate = self;
    [self setup:[[JHTopicController alloc] init] withTitle:@"精华" imageName:@"tabBar_essence_icon" andSelectedImageName:@"tabBar_essence_click_icon"];
    [self setup:[[JHTopicController alloc] init] withTitle:@"新帖" imageName:@"tabBar_new_icon" andSelectedImageName:@"tabBar_new_click_icon"];
    [self setup:[[JHFocusController alloc] init] withTitle:@"关注" imageName:@"tabBar_friendTrends_icon" andSelectedImageName:@"tabBar_friendTrends_click_icon"];
    [self setup:[[JHMeController alloc] init] withTitle:@"我" imageName:@"tabBar_me_icon" andSelectedImageName:@"tabBar_me_click_icon"];
}

- (void)publishClicked {
    JHPublishController *publishVC = [[JHPublishController alloc] init];
    
    [self presentViewController:publishVC animated:YES completion:nil];
}

// 初始化所以控制器
- (void)setup:(UIViewController *)vc withTitle:(NSString *)title imageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName{
    
    NSDictionary *textAttr = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    [vc.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    if (![vc isKindOfClass:[JHTopicController class]]) {
        vc.navigationItem.title = title;
        JHNavigationController *nav = [[JHNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
        return;
    } else {
        [self addChildViewController:vc];
    }
}

@end
