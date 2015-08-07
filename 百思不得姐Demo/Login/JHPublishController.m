//
//  JHPulishController.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/8/2.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHPublishController.h"
#import "JHSelectButton.h"

// 动画开始时的初始高度偏移量
#define btnHighOffsetY 900
#define btnAnimationDelayTime (NSInteger)fabs((view.x - self.view.center.x - view.y)) * 0.001
// 高度偏移量,设置一开始的隐藏高度偏移量
#define btnHiddenOffset 1800


@interface JHPublishController ()

/** 按钮数组 */
@property (nonatomic, strong)NSMutableArray *btnArray;
/** 动画是否完成 */
//@property (nonatomic, strong)BOOL isFinishAnimation;
@end

@implementation JHPublishController

- (NSMutableArray *)btnArray {
    if (!_btnArray ) {
        _btnArray = [NSMutableArray array];
    }
    
    return _btnArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    for (UIButton *btn in self.btnArray) {
//        btn.hidden = NO;
//        btn.y += btnHighOffsetY;
//        [self setDownAnimationWithView:btn];
//    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (UIButton *btn in self.btnArray) {
        btn.y += btnHighOffsetY;
        [self setDownAnimationWithView:btn];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 重置按钮添加累加器
    i = 0;
    self.view.backgroundColor = JHRGBColor(50, 50, 50, 0.9);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"slogan"] forState:UIControlStateNormal];
    btn.center = CGPointMake(self.view.x, 80);
    [self.view addSubview:btn];
    
    [self setupBtnWithImageName:@"publish-video" andTitle:@"发视频"];
    [self setupBtnWithImageName:@"publish-picture" andTitle:@"发图片"];
    [self setupBtnWithImageName:@"publish-text" andTitle:@"发段子"];
    [self setupBtnWithImageName:@"publish-audio" andTitle:@"发声音"];
    [self setupBtnWithImageName:@"publish-review" andTitle:@"审帖" ];
    [self setupBtnWithImageName:@"publish-offline" andTitle:@"离线下载"];
}

// 按钮添加累加器
static int i = 0;
/** 配置各按钮的位置 */
- (void)setupBtnWithImageName:(NSString *)imageName andTitle:(NSString *)title {

    JHSelectButton *btn = [JHSelectButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    
    CGFloat h = i % 3;
    CGFloat l = i / 3;
    CGFloat x = 100 * (h - 1) + self.view.center.x;
    CGFloat y = 120 * (l - 1) + self.view.center.y - btnHiddenOffset;
    CGFloat btnWidth = 80;
    CGFloat btnHeight = 100;
    x -= btnWidth * 0.5;
    btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
    
    [btn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    i++;
    [self.view addSubview:btn];
    [self.btnArray addObject:btn];
}

/** 按钮的响应事件方法 */
- (void)selectBtnClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 出场和退场动画 */
- (void)setDownAnimationWithView:(UIView *)view {
    [UIView animateWithDuration:animationDuration delay:btnAnimationDelayTime options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.y += btnHighOffsetY;
    } completion:^(BOOL finished) {
        i++;
    }];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    // dismiss前添加动画
    for (UIButton *btn in self.btnArray) {
        [self setDownAnimationWithView:btn];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * animationDuration * 0.8), dispatch_get_main_queue(), ^{
        [super dismissViewControllerAnimated:flag completion:completion];
    });
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (i == 12) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
