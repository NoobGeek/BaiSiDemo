//
//  UIBarButtonItem+JHBarButtonExt.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/26.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "UIBarButtonItem+JHBarButtonExt.h"

@implementation UIBarButtonItem (JHBarButtonExt)

+ (instancetype)itemWithImage:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = button.currentImage.size;
    return [[self alloc] initWithCustomView:button];

}


@end
