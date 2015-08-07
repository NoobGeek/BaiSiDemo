//
//  JHSelectButton.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/8/2.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHSelectButton.h"

@implementation JHSelectButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, self.height - 20, self.width, 20);
    self.imageView.frame = CGRectMake(0, 0 , self.width, self.height - 20);
}

@end
