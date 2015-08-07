//
//  UIBarButtonItem+JHBarButtonExt.h
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/26.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JHBarButtonExt)

+ (instancetype)itemWithImage:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action;


@end
