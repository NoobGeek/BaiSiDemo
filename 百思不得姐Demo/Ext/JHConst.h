//
//  JHConst.h
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/29.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum : NSUInteger {
    JHTopicAll = 10,
    JHTopicViedo = 11,
    JHTopicPicture = 12,
    JHTopicText = 13,
    JHTopicTop = 14,
    JHTopicMenuBtn = 15
} JHTopicType;

// 帖子cell的水平边距
UIKIT_EXTERN CGFloat const JHTopicCellHMargin;

//帖子cell的垂直边距
UIKIT_EXTERN CGFloat const JHTopicCellVMargin;

// 帖子文本的字体大小
UIKIT_EXTERN NSInteger const JHTopicCellFontSize;

// 帖子评论的字体大小
UIKIT_EXTERN NSInteger const JHTopicCommentFontSize;