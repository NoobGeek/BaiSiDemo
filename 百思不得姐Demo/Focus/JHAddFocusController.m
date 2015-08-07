//
//  JHAddFocusController.m
//  百思不得姐Demo
//
//  Created by Tony Stark on 15/7/26.
//  Copyright (c) 2015年 Tony Stark. All rights reserved.
//

#import "JHAddFocusController.h"

@interface JHAddFocusController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end

@implementation JHAddFocusController



- (void)viewDidLoad{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.rightTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
//    self.leftTableView.dataSource = self;
    self.rightTableView.dataSource = self;
    self.view.backgroundColor = [UIColor redColor];
//    [self.rightTableView registerNib:[UINib nibWithNibName:@"JHTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];

    // 请求数据
}

- (void)getTypeData{
    // 请求类型数据,回调主数据
}

- (void)getMainData{
    
}
#pragma mark <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JHTableViewCell" owner:nil options:nil].lastObject;
    }
    return cell;
}




@end
