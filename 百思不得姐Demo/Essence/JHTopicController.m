//
//  JHTopicController.m
//  
//
//  Created by Tony Stark on 15/7/22.
//
//

#import "JHTopicController.h"
#import "UIBarButtonItem+JHBarButtonExt.h"
#import "JHTopicContentController.h"
//#import <objc/runtime.h>



// 后面菜单按钮的宽度
#define menuBtnWidth 30.0



// 按钮宽度计算
#define btnWidth (self.view.size.width - menuBtnWidth) / 5.0

@interface JHTopicController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *navigationContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
/** 导航栏下面的红色指示器 */
@property (nonatomic, strong)UIView *indicatorView;

@end

// JHTopicType -> 序号
int topicToNo(int a){
    return (a % 10);
}

//// offsetX -> tag
//NSInteger tagFromeOffsetX(CGFloat offsetX) {
//    return (NSInteger)(offsetX / JHScreenBounds.size.width);
//}

@implementation JHTopicController

/** TopicType枚举值转换为字符串 */
- (NSString *)stringFromTopicType:(JHTopicType)topicType {
    NSString *typeName;
    switch (topicType) {
        case JHTopicAll:
            typeName = @"全部";
            break;
        case JHTopicViedo:
            typeName = @"视频";
            break;
        case JHTopicPicture:
            typeName = @"图片";
            break;
        case JHTopicText:
            typeName = @"段子";
            break;
        case JHTopicTop:
            typeName = @"排行";
            break;
        default:
            break;
    }
    return typeName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentScrollView.delegate = self;
    
    // 设置精华板块
    self.view.backgroundColor = JHSetBackgroundColor();
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.contentScrollView.contentSize = CGSizeMake(JHScreenBounds.size.width * 5, 0);
//    [self getIvars];
}

//- (void)getIvars {
//    unsigned int ivarCount;
//    Ivar *ivar = class_copyIvarList([UIButton class], &ivarCount);
//    for (unsigned int i = 0; i < ivarCount; i++) {
//        NSLog(@"%s", ivar_getName(ivar[i]));
//    }
//    free(ivar);
//}

/** 在已经显示视图后配置视图frame的计算才正确 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self setupNavigationContentView];
    // 添加第一个topicContentView
    [self moveTheIndicatorView:nil orOffset:0];

}

/** 导航栏红色指示器 */
- (UIView *)indicatorView {
    if (!_indicatorView) {

        _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationContentView.height - 2, btnWidth, 2)];
        _indicatorView.backgroundColor = [UIColor redColor];
    }
    return _indicatorView;
}

/** 设置板块导航栏 */
- (void)setupNavigationContentView {
    self.navigationContentView.backgroundColor = JHBarBackgroundColor;
    [self setupNavBtnWithTopicType:JHTopicAll];
    [self setupNavBtnWithTopicType:JHTopicViedo];
    [self setupNavBtnWithTopicType:JHTopicPicture];
    [self setupNavBtnWithTopicType:JHTopicText];
    [self setupNavBtnWithTopicType:JHTopicTop];
    [self setupNavBtnWithTopicType:JHTopicMenuBtn];
    
    [self.navigationContentView addSubview:self.indicatorView];
    
}

/** 导航栏按钮初始化方法 */
- (void)setupNavBtnWithTopicType:(JHTopicType)topicType {
    // 如果是右边的菜单按钮
    if (topicType == JHTopicMenuBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        CGFloat width = menuBtnWidth;
        CGFloat height = 44;
        CGFloat x = btnWidth * topicToNo(topicType);
        CGFloat y = 20;
        btn.frame = CGRectMake(x, y, width, height);
        [btn addTarget:self action:@selector(menuBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationContentView addSubview:btn];
        return;
    }
    // 导航栏是普通按钮的初始化
    NSString *title = [self stringFromTopicType:topicType];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = topicType;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    CGFloat width = btnWidth;
    CGFloat height = 44;
    CGFloat x = width * topicToNo(topicType);
    CGFloat y = 20;
    btn.frame = CGRectMake(x, y, width, height);
    [btn addTarget:self action:@selector(moveTheIndicatorView:orOffset:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationContentView addSubview:btn];
    
    JHTopicContentController *tableVC = [[JHTopicContentController alloc] init];
    tableVC.type = topicType;
    
    [self addChildViewController:tableVC];
    
}

/** 菜单按钮事件 */
- (void)menuBtnClicked {

}



/** 设置红色指示器动画(导航栏按钮点击响应方法) */
- (void)moveTheIndicatorView:(UIButton *)sender orOffset:(CGFloat)offsetX {
    NSInteger tag;
    if (sender) {
        tag = sender.tag - 10;
        offsetX = tag * self.contentScrollView.width;
    } else {
        tag = (NSInteger)(offsetX / self.contentScrollView.width);
    }
    // 添加subView
    JHTopicContentController *vc = self.childViewControllers[tag];
    vc.view.frame = CGRectMake(offsetX, 0, self.contentScrollView.width, self.contentScrollView.height);
    [self.contentScrollView addSubview:vc.view];
    
    [UIView animateWithDuration:animationDuration animations:^{
        self.contentScrollView.contentOffset = CGPointMake(offsetX, 0);
        self.indicatorView.x = [self.view viewWithTag:tag + 10].x;
    } completion:nil];
    

}

/** 设置后面的scrollView */
//- (void)setupTopicContentView:(JHTopicType)topicType {
//    // 如果是菜单按钮就退出
//    if (topicType == JHTopicMenuBtn) return;
//        
//    CGRect rect = self.contentScrollView.bounds;
//    rect.origin.x = topicToNo(topicType) * self.view.width;
//    JHTopicContentController *topicContentVC = [[JHTopicContentController alloc] init];
//    topicContentVC.view.frame = rect;
//    [self addChildViewController:topicContentVC];
//    [self.contentScrollView addSubview:topicContentVC.view];
//}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    JHLog(@"Animation");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self moveTheIndicatorView:nil orOffset:scrollView.contentOffset.x];
}




@end
