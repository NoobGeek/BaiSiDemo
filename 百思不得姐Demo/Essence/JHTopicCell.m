//
//  JHTopicCell.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/31.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHTopicCell.h"
#import <UIImageView+WebCache.h>
#import "JHTopicModel.h"

@interface JHTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *niceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *textContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation JHTopicCell

+ (instancetype)cell {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (void)awakeFromNib {
    
}

- (void)setFrame:(CGRect)frame {
    frame.size.height = self.topic.cellHeight;
    [super setFrame:frame];
}



- (void)setTopic:(JHTopicModel *)topic {
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.niceNameLabel.text = topic.name;
    self.timeLabel.text = topic.create_time;
    self.textContentLabel.text = topic.text;
    
    _topic = topic;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
