//
//  JHTopicComment.h
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/8/6.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JHTopicUser;

@interface JHTopicComment : NSObject

/** id */
@property (nonatomic, copy) NSString *ID;
/** 音频文件的时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 音频文件的路径 */
@property (nonatomic, copy) NSString *voiceuri;
/** 评论的文字内容 */
@property (nonatomic, copy) NSString *content;
/** 被点赞的数量 */
@property (nonatomic, assign) NSInteger like_count;
/** 用户 */
@property (nonatomic, strong) JHTopicUser *user;

@end
