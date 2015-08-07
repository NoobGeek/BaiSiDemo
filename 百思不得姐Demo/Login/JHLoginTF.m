//
//  JHLoginTF.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/28.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHLoginTF.h"

@implementation JHLoginTF




- (void)setPlaceholderLabelWithColor:(UIColor *)color {
    UILabel *placeholderLaber = [self valueForKey:@"placeholderLabel"];
    [placeholderLaber setTextColor:color];
}

- (BOOL)becomeFirstResponder {
    self.textColor = JHRGBColor(11, 11, 11, 1);
    [self setPlaceholderLabelWithColor:self.textColor];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    self.textColor = JHRGBColor(123, 123, 123, 1);
    [self setPlaceholderLabelWithColor:self.textColor];
    return [super resignFirstResponder];
}


@end
