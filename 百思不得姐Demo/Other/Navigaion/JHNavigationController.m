//
//  JHNavigationController.m
//  
//
//  Created by Tony Stark on 15/7/22.
//
//

#import "JHNavigationController.h"

@interface JHNavigationController ()

@end

@implementation JHNavigationController

+ (void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIFont systemFontOfSize:16];
    attr[NSForegroundColorAttributeName] = [UIColor blueColor];
    [navBar setTitleTextAttributes:attr];
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

//    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers > 0) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backButton setSize:CGSizeMake(70, 30)];
        [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        
        UIBarButtonItem *backBarButtone = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.navigationItem.leftBarButtonItem = backBarButtone;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}




@end