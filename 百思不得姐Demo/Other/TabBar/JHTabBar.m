//
//  JHTabBar.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/22.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHTabBar.h"
#import "JHPublishController.h"
#import "JHTabBarController.h"

@interface JHTabBar ()
/** 发布按钮 */
@property (nonatomic, weak)UIButton *pulishButton;


@end

@implementation JHTabBar



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.pulishButton = [UIButton buttonWithType:UIButtonTypeCustom];

        [self.pulishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.pulishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self.pulishButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        self.backgroundColor = JHBarBackgroundColor;
        [self addSubview:self.pulishButton];
    }
    return self;
}

- (void)btnClicked {
    [self.controllerDelegate publishClicked];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint center = CGPointMake(self.center.x, self.height * 0.5);
    self.pulishButton.center = center;
    self.pulishButton.size = self.pulishButton.currentImage.size;
    
    CGFloat _width = self.width * 0.2;
    CGFloat _height = self.height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (button == self.pulishButton || ![button isKindOfClass:[UIControl class]]) continue;
        button.frame = CGRectMake(_width * ((index>1)? (index+1):index) , 0, _width, _height);
        index++;
    }
}





@end
