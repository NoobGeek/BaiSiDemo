//
//  JHTopicContentController.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/31.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//  

#import "JHTopicContentController.h"
#import "JHTopicCell.h"
#import <AFNetworking.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "JHTopicModel.h"
#import "JHNewController.h"



@interface JHTopicContentController ()
{
    /** 模型数组 */
    NSMutableArray *_topics;
    


}


@end

@implementation JHTopicContentController

- (NSMutableArray *)topics {
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)setTopics:(NSMutableArray *)topics {
    _topics = topics;
//    JHLog(@"%@", [_topics[0] valueForKey:@"name"]);
    [self.tableView reloadData];
}


static NSString *reuseID = @"topicCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupRefresh];
    
}

- (void)setupTableView {
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 44, 0);
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JHTopicCell class]) bundle:nil] forCellReuseIdentifier:reuseID];
}

- (void)setupRefresh {
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    self.tableView.header.autoChangeAlpha = YES;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 54, 0);
    
    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
}

/** a参数 */
- (NSString *)a {
    return ([self.parentViewController isKindOfClass:[JHTopicController class]] ? @"list":@"newlist");
}
/** 头部刷新重新获取数据 */
- (void)headRefresh {
    NSString *url = @"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.a;
    params[@"c"] = @"data";
    params[@"type"] = @(topicTypeFunc(self.type));
    [[AFHTTPSessionManager manager] GET:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [self setTopics:[JHTopicModel objectArrayWithKeyValuesArray:(NSArray *)responseObject[@"list"]]];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

/** 尾部刷新拼接更多数据 */
- (void)footerRefresh {

}

NSInteger topicTypeFunc(JHTopicType topicType) {
    switch (topicType) {
        case 10:
            return 1;
            break;
        case 11:
            return 41;
            break;
        case 12:
            return 10;
            break;
        case 13:
            return 29;
            break;
        case 14:
            return 1;
            break;
        default:
            break;
    }
    return 1;
}




#pragma mark <UITableViewDataSource>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JHTopicCell *cell = [JHTopicCell cell];
    
    return cell;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [_topics[indexPath.row] valueForKey:<#(NSString *)#>];
//}


#pragma mark <UITableViewDelegate>



@end
