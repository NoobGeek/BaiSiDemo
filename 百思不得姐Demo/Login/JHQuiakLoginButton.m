//
//  JHQuiakLoginButton.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/27.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHQuiakLoginButton.h"

@implementation JHQuiakLoginButton

- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, 70, 70);
    self.titleLabel.frame = CGRectMake(0, 70, 70, 20);
}

@end
