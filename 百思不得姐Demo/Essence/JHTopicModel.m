//
//  JHTopicModel.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/8/3.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHTopicModel.h"
#import <MJExtension.h>
#import "JHTopicComment.h"

@implementation JHTopicModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"ID" : @"id",
             @"top_cmt" : @"top_cmt[0]" //,
             //             @"qzone_uid" : @"top_cmt[0].user.qzone_uid"
             };
}

- (void)setHeight:(CGFloat)height {
    CGSize maxSize = CGSizeMake(JHScreenBounds.size.width - JHTopicCellHMargin, MAXFLOAT);
    CGFloat textLabelHeight = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:JHTopicCellFontSize]} context:nil].size.height;
    CGFloat commentH = [self.top_cmt.content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:JHTopicCommentFontSize]} context:nil].size.height;
    
    
    textLabelHeight += JHTopicCellVMargin * 3 + 64 + 44 + (self.top_cmt == nil ? :commentH + JHTopicCellVMargin);
    _height = textLabelHeight;
}

@end
