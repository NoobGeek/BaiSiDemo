//
//  JHTopicCell.h
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/31.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTopicModel;

@interface JHTopicCell : UITableViewCell

/** 模型 */
@property (nonatomic, strong)JHTopicModel *topic;

+ (instancetype)cell;



@end
