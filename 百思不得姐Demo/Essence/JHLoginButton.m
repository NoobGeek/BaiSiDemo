//
//  JHLoginButton.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/27.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHLoginButton.h"

@interface JHLoginButton ()
/** layer圆角半径 */
@property (nonatomic, assign)IBInspectable CGFloat customCornerRadius;
@end

@implementation JHLoginButton


- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = self.customCornerRadius;
}


@end
